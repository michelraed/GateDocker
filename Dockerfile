FROM ubuntu:22.04

# Noninteractive apenas para o build não travar em perguntas de teclado/fuso horário
ENV DEBIAN_FRONTEND=noninteractive

# 1. DEPENDÊNCIAS (Adicionado curl e libs gráficas extras)
RUN apt-get update && apt-get install -y \
    build-essential cmake git wget curl g++ gcc gfortran \
    libx11-dev libxext-dev libxft-dev libxpm-dev libxmu-dev \
    libssl-dev libglu1-mesa-dev libglew-dev libxt-dev \
    libxml2-dev libtbb-dev libpcre3-dev libfftw3-dev \
    libcfitsio-dev libgsl-dev libmotif-dev libexpat1-dev \
    python3-dev python3-numpy libtool m4 automake \
    qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5opengl5-dev \
    libinsighttoolkit5-dev libvtk9-dev x11-apps \
    libgl1-mesa-glx libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# 2. ROOT
WORKDIR /opt
RUN wget https://root.cern/download/root_v6.30.04.Linux-ubuntu22.04-x86_64-gcc11.4.tar.gz \
    && tar -xvf root_v6.30.04.Linux-ubuntu22.04-x86_64-gcc11.4.tar.gz \
    && rm root_v6.30.04.Linux-ubuntu22.04-x86_64-gcc11.4.tar.gz
ENV ROOTSYS=/opt/root
ENV PATH=$ROOTSYS/bin:$PATH
ENV LD_LIBRARY_PATH=$ROOTSYS/lib

# 3. XRAYLIB
WORKDIR /opt
RUN wget https://github.com/tschoonj/xraylib/releases/download/xraylib-4.0.0/xraylib-4.0.0.tar.gz \
    && tar -xvf xraylib-4.0.0.tar.gz
WORKDIR /opt/xraylib-4.0.0
RUN ./configure --disable-python --disable-lua --disable-fortran \
    && make -j$(nproc) \
    && make install

# 4. GEANT4 11.2 (Configurações da sua imagem)
WORKDIR /opt/geant4-source
RUN wget https://geant4-data.web.cern.ch/releases/geant4-v11.2.0.tar.gz \
    && tar -xvf geant4-v11.2.0.tar.gz
WORKDIR /opt/geant4-build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/geant4-install \
          -DGEANT4_INSTALL_DATA=OFF -DGEANT4_USE_GDML=ON -DGEANT4_USE_QT=ON \
          -DGEANT4_USE_XM=ON -DGEANT4_USE_OPENGL_X11=ON ../geant4-source/geant4-v11.2.0 \
    && make -j$(nproc) && make install

# AGORA COM CURL INSTALADO, VAI FUNCIONAR:
RUN /opt/geant4-install/bin/geant4-config --install-datasets

# 5. GATE 9.4.1 (Configurações da sua imagem)
WORKDIR /opt/gate-source
RUN wget https://github.com/OpenGATE/Gate/archive/refs/tags/v9.4.1.tar.gz \
    && tar -xvf v9.4.1.tar.gz
WORKDIR /opt/gate-build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/gate-install \
          -DGeant4_DIR=/opt/geant4-install/lib/cmake/Geant4 \
          -DGATE_USE_ITK=ON -DGATE_USE_XRAYLIB=ON -DXRAYLIB_DIR=/usr/local \
          -DGATE_USE_GEANT4_UIVIS=ON ../gate-source/Gate-9.4.1 \
    && make -j$(nproc) && make install

# 6. CONFIGURAÇÃO FINAL
RUN echo "source /opt/geant4-install/bin/geant4.sh" >> /etc/bash.bashrc
ENV PATH=/opt/gate-install/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /home/montecarlo
CMD ["/bin/bash"]

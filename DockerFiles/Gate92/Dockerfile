FROM ubuntu:22.04

# Noninteractive para o build não travar
ENV DEBIAN_FRONTEND=noninteractive

# 1. DEPENDÊNCIAS
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

# 2. ROOT (v6.30.04 - Compilado nativamente com C++17)
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

# 4. GEANT4 11.0.p03 (Versão recomendada pelo log do GATE 9.2)
WORKDIR /opt/geant4-source
RUN wget https://geant4-data.web.cern.ch/releases/geant4-v11.0.3.tar.gz \
    && tar -xvf geant4-v11.0.3.tar.gz
WORKDIR /opt/geant4-build
# IMPORTANTE: Forçando CMAKE_CXX_STANDARD=17 para alinhar com o ROOT
RUN cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/opt/geant4-install \
          -DCMAKE_CXX_STANDARD=17 \
          -DGEANT4_INSTALL_DATA=OFF \
          -DGEANT4_USE_GDML=ON \
          -DGEANT4_USE_QT=ON \
          -DGEANT4_USE_XM=ON \
          -DGEANT4_USE_OPENGL_X11=ON \
          ../geant4-source/geant4-v11.0.3 \
    && make -j$(nproc) && make install

RUN /opt/geant4-install/bin/geant4-config --install-datasets

# 5. GATE 9.2
WORKDIR /opt/gate-source
RUN wget https://github.com/OpenGATE/Gate/archive/refs/tags/v9.2.tar.gz \
    && tar -xvf v9.2.tar.gz
WORKDIR /opt/gate-build
# IMPORTANTE: Forçando CMAKE_CXX_STANDARD=17 e apontando para o Geant4 11.0
RUN cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/opt/gate-install \
          -DCMAKE_CXX_STANDARD=17 \
          -DGeant4_DIR=/opt/geant4-install/lib/Geant4-11.0.3 \
          -DGATE_USE_ITK=ON \
          -DGATE_USE_XRAYLIB=ON \
          -DXRAYLIB_DIR=/usr/local \
          -DGATE_USE_GEANT4_UIVIS=ON \
          -DGATE_USE_OPTICAL=ON \
          ../gate-source/Gate-9.2 \
    && make -j$(nproc) && make install

# 6. CONFIGURAÇÃO FINAL
RUN echo "source /opt/geant4-install/bin/geant4.sh" >> /etc/bash.bashrc
ENV PATH=/opt/gate-install/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /home/montecarlo
CMD ["/bin/bash"]
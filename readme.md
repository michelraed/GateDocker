# GATE Docker Simulation Environment

Este repositório contém scripts de automação para instalar e executar o **GATE (Geant4 Application for Tomographic Emission)** versões 9.0 e 9.4.1 utilizando Docker. O ambiente está configurado para suportar interface gráfica e mapeamento automático de arquivos locais.

## 📂 Estrutura do Repositório

Escolha o seu sistema operacional abaixo para visualizar as instruções de instalação e uso:

### 🐧 [Linux](https://www.google.com/search?q=./Linux/readme_linux.md)

* **Instalação**: Scripts `.sh` para download e configuração de tags.
* **Requisitos**: Docker, X11 Server e permissões de grupo.
* **Destaque**: Instruções para criação de `aliases` no `.bashrc` para facilitar o uso via terminal.

### 🪟 [Windows](https://www.google.com/search?q=./Window/readme_windows.md)

* **Instalação**: Scripts `.bat` automatizados para CMD/PowerShell.
* **Requisitos**: Docker Desktop e VcXsrv (XLaunch) configurado.
* **Destaque**: Configuração de **Path Mirroring**, onde o diretório do Windows é espelhado exatamente dentro do container.

---

## 🛠️ Funcionalidades Principais

* **Limpeza Automática**: Os scripts baixam as imagens oficiais e removem as tags longas, mantendo apenas `gate90:latest` e `gate941:latest`.
* **Suporte Gráfico**: Configuração integrada para visualização de simulações via X11 ou VcXsrv.
* **Persistência de Dados**: O diretório atual de execução é montado como volume, garantindo que arquivos `.mac` sejam lidos e os outputs sejam salvos na sua máquina local.

---

## 🚀 Como começar?

1. Clone este repositório.
2. Navegue até a pasta correspondente ao seu sistema (`Linux` ou `Window`).
3. Siga as instruções contidas no `README` específico da pasta.

---

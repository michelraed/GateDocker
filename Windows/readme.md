---

# 🪟 Guia de Instalação e Execução do GATE (Windows)

Este guia fornece instruções detalhadas para a instalação e execução do **GATE** (*Geant4 Application for Tomographic Emission*) no Windows, utilizando Docker e scripts de automação.

---

## 📋 Pré-requisitos

Antes de executar os scripts, certifique-se de configurar o ambiente corretamente:

1. **Docker Desktop**
* Deve estar instalado e com o status *Running* (Em execução).


2. **Servidor X (VcXsrv / XLaunch)**
* Necessário para exibir a interface gráfica das simulações.
* > **⚠️ Importante:** Ao configurar o **XLaunch**, na etapa *Extra Settings*, você **deve** marcar a opção:
> * **Disable access control**
> 
> 




3. **Configuração de Display**
* Os scripts já estão configurados para usar `host.docker.internal:0.0`, direcionando a interface gráfica do container para o Windows.



---

## 🚀 Instalação

Os scripts `.bat` automatizam o processo de *download* das imagens oficiais, renomeiam para *tags* curtas e removem as etiquetas longas para manter o Docker organizado.

### Opção 1: Instalação Completa (Recomendado)

Para baixar e configurar as versões **9.0** e **9.4.1** sequencialmente:

* Execute o arquivo: `installGates.bat`

### Opção 2: Instalação Individual

Caso deseje instalar apenas uma versão específica:

* **GATE 9.0:** Execute `install_gate90.bat`
* **GATE 9.4.1:** Execute `install_gate941.bat`

> **✅ Verificação:** Ao final do processo, o script listará automaticamente todas as imagens disponíveis contendo "gate" no nome para confirmar o sucesso da instalação.

---

## 💻 Como Executar as Simulações

Os scripts de execução utilizam **espelhamento de caminho** (*Path Mirroring*). A pasta onde o script for executado no Windows será montada como o diretório de trabalho dentro do Linux/Docker.

### Para rodar o GATE 9.0

1. Abra o terminal na pasta do seu projeto (onde estão os arquivos `.mac`).
2. Execute:
```bat
runGate90.bat

```



### Para rodar o GATE 9.4.1

1. Abra o terminal na pasta do seu projeto.
2. Execute:
```bat
runGate941.bat

```



---

## 🔍 Detalhes Técnicos dos Scripts

Abaixo, os parâmetros Docker utilizados para garantir a integração entre Windows e Linux:

| Parâmetro | Função |
| --- | --- |
| `--rm` | Remove o container automaticamente ao fechar, economizando espaço. |
| `--env="DISPLAY=..."` | Configura a variável de ambiente para enviar gráficos ao host Windows. |
| `--volume="%cd%:%cd%"` | Mapeia o diretório atual do Windows para o container (Volume). |
| `--workdir="%cd%"` | Define que o terminal iniciará já dentro da pasta mapeada. |

---
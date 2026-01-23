Este guia fornece instruções detalhadas para a instalação e execução do **GATE** (Geant4 Application for Tomographic Emission) no Windows utilizando Docker e scripts de automação.

---

## 📋 Pré-requisitos

Antes de executar os scripts, certifique-se de configurar o ambiente:

1. **Docker Desktop**: Deve estar instalado e em execução.


2. **Servidor X (VcXsrv/XLaunch)**: Necessário para a interface gráfica das simulações.

* Ao configurar o **XLaunch**, é obrigatório marcar a opção **"Disable access control"** para permitir a conexão do container.

3. **Configuração de Display**: Os scripts utilizam `host.docker.internal:0.0` para direcionar a interface gráfica ao Windows.


---

## 🚀 Instalação

Os scripts `.bat` automatizam o download das imagens oficiais, renomeiam para tags curtas e removem as etiquetas longas para economizar espaço e organização.

### Opção 1: Instalação Completa (Recomendado)

Para instalar as versões 9.0 e 9.4.1 simultaneamente:

* Execute o arquivo `installGates.bat`.



### Opção 2: Instalação Individual

* 
**GATE 9.0**: Execute `install_gate90.bat`.


* 
**GATE 9.4.1**: Execute `install_gate941.bat`.



> 
> **Nota:** Ao final, o script listará todas as imagens disponíveis que contêm "gate" em seu nome.
> 
> 

---

## 💻 Como Executar as Simulações

Os scripts de execução foram configurados para realizar o **espelhamento de caminho (Path Mirroring)**. Isso significa que a pasta onde você executa o script no Windows será exatamente o diretório de trabalho dentro do Linux/Docker.

### Executando o GATE 9.0

1. Abra o terminal ou navegue até a pasta do seu projeto.
2. Execute o arquivo `runGate90.bat`.



### Executando o GATE 9.4.1

1. Abra o terminal ou navegue até a pasta do seu projeto.
2. Execute o arquivo `runGate941.bat`.



---

## 🔍 Detalhes Técnicos dos Scripts

Os arquivos de execução utilizam os seguintes parâmetros do Docker:

| Parâmetro | Função |
| --- | --- |
| `--rm` | Remove o container automaticamente após o fechamento.

 |
| `--env="DISPLAY=..."` | Configura a saída gráfica para o host Windows.

 |
| `--volume="%cd%:%cd%"` | Mapeia o diretório atual do Windows para o mesmo caminho no container.

 |
| `--workdir="%cd%"` | Define o ponto de entrada do terminal na sua pasta atual.

 |

---


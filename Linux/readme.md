Este guia descreve como instalar e utilizar as versões 9.2 e 9.4.1 do **GATE** (Geant4 Application for Tomographic Emission) via Docker no Linux, utilizando os scripts fornecidos.

---

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

1. **Docker**: [Guia oficial de instalação](https://docs.docker.com/engine/install/).
2. **X11 Server**: Necessário para a interface gráfica (comum em distribuições desktop Linux).
3. **Permissões**: Certifique-se de que seu usuário pertence ao grupo `docker` para rodar comandos sem `sudo`.

---

## 🚀 Instalação

Os scripts de instalação automatizam o download das imagens, criam apelidos (tags) curtos e removem os nomes longos dos repositórios originais para manter seu ambiente limpo.

### Opção A: Instalar ambas as versões (Recomendado)

Execute o script unificado:

```bash
chmod +x install_gate_docker.sh
./install_gate_docker.sh

```

### Opção B: Instalar versões individuais

Se desejar apenas uma versão específica, utilize:

* **GATE 9.2:** `./install_gate92.sh`
* **GATE 9.4.1:** `./install_gate941.sh`

---

## 💻 Como Utilizar

Os scripts de execução (`runGate`) configuram o ambiente gráfico e montam o diretório atual dentro do container.

### 1. GATE 9.2

```bash
chmod +x runGate92.sh
./runGate90.sh

```

### 2. GATE 9.4.1

```bash
chmod +x runGate941.sh
./runGate941.sh

```

**O que esses scripts fazem?**

* Liberam permissão no X11 (`xhost +local:docker`).
* Montam o volume do seu diretório atual (`$PWD`) dentro do container.
* Definem o diretório de trabalho como o seu atual, permitindo que o GATE leia seus arquivos `.mac` e salve os resultados diretamente na sua pasta.

---

## ⚡ Atalhos no Sistema (Bashrc)

Para facilitar o uso diário sem precisar navegar até a pasta dos scripts, adicione aliases ao seu arquivo `~/.bashrc`.

1. Abra o arquivo:
```bash
nano ~/.bashrc

```


2. Adicione as seguintes linhas ao final do arquivo (ajuste o caminho `/caminho/para/os/scripts/` para o local real onde os arquivos estão salvos):

```bash
# Aliases para o GATE Docker
alias gate90='/caminho/para/os/scripts/runGate90.sh'
alias gate941='/caminho/para/os/scripts/runGate941.sh'

```

3. Recarregue as configurações:
```bash
source ~/.bashrc

```



**Agora você pode iniciar o GATE de qualquer pasta apenas digitando `gate92` ou `gate941` no terminal.**

---

## 🛠️ Resumo de Comandos Docker Úteis

Caso precise gerenciar suas imagens manualmente:

* **Listar imagens:** `docker images | grep gate`
* **Remover container travado:** `docker rm -f simulacao_gate`
* **Limpar imagens não utilizadas:** `docker image prune`

---

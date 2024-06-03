# Sistema de fila - Challenge
![wins-pvp](https://media.licdn.com/dms/image/D4E3DAQHCaU1c6m-X3g/image-scale_191_1128/0/1705466836758/winsvuegg_cover?e=1717862400&v=beta&t=tLl-CBi22XPn23y6iRqhQdvy-6MrY0xsCkurXAY05CU)

PROBLEMA: Desenvolvi um modo de jogo de PVP que concentra 10 jogadores divididos igualmente em dois times, os quais disputarão round a round até que um dos times atinja 13 pontos e assim a vitória. Com o modo de jogo pronto, necessito de um sistema de filas que identifique grupos de jogadores buscando por partida e que forme times prontos para requisitar a criação da partida do modo de jogo.

CONDIÇÕES GERAIS: Por se tratar de um sistema de fila que comporta a formação de times basedos em grupos, os jogadores em um grupo "incompleto" não podem ser separados e precisam permanecer juntos durante a formação de um time. Os grupos dos jogadores devem ser persistidos para que ao fim da partida, os mesmos retornem a busca de novos times e partidas no mesmo grupo.

SOLUÇÃO REQUERIDA: A formação de times de 5 jogadores; A preservação dos grupo; A definição dos times de ataque e defesa da times partida; O consumo de uma função (Fictícia), quando os times estiverem prontos para iniciar a partida;

### PROBLEMA
1. Desenvolvemos um modo de jogo de PVP que concentra 10 jogadores divididos igualmente em dois times, os quais disputarão round a round até que um dos times atinja 13 pontos e assim a vitória.

2. Com o modo de jogo pronto, necessitaremos de um sistema de filas que identifique grupos de jogadores buscando por partida e que forme times prontos para requisitar a criação da partida do modo de jogo.

### CONDIÇÕES GERAIS
1. Por se tratar de um sistema de fila que comporta a formação de times basedos em grupos, os jogadores em um grupo "incompleto" não podem ser separados e precisam permanecer juntos durante a formação de um time.

2. Os grupos dos jogadores devem ser persistidos para que ao fim da partida, os mesmos retornem a busca de novos times e partidas no mesmo grupo.

### OBSERVAÇÕES IMPORTANTES

1. Utilize Lua como linguagem principal para o desenvolvimento, fora do ambiente do FiveM.

2. Priorize a eficiência e a escalabilidade do sistema.

3. Documente adequadamente o código para facilitar a manutenção e futuras expansões.

4. Envie o código para um repositório destinado ao desafio, fazendo o uso de boas práticas do uso do Git & Github.

### SOLUÇÃO REQUERIDA
1. A formação de times de 5 jogadores;

2. A preservação dos grupo;

3. A definição dos times de ataque e defesa da times partida;

4. O consumo de uma função (Fictícia), quando os times estiverem prontos para iniciar a partida;

___
## Guia de Instalação do Lua no Windows

### Passo 1: Baixar o Lua
1. Abra seu navegador e vá para a [página de downloads do Lua](https://luabinaries.sourceforge.net/download.html).
2. Baixe a versão mais recente do Lua para Windows, normalmente em um arquivo .zip.

### Passo 2: Extrair o Conteúdo do Arquivo .zip
1. Navegue até a pasta onde o arquivo .zip foi baixado.
2. Clique com o botão direito no arquivo .zip e selecione "Extrair Tudo...".
3. Escolha um local onde você deseja extrair os arquivos, por exemplo, `C:\Lua`.

### Passo 3: Configurar as Variáveis de Ambiente
1. Abra o **Painel de Controle**.
2. Vá para **Sistema e Segurança** > **Sistema** > **Configurações avançadas do sistema**.
3. Na janela que abrir, clique em **Variáveis de Ambiente**.
4. Na seção **Variáveis de Sistema**, encontre a variável chamada `Path` e clique em **Editar**.
5. Clique em **Novo** e adicione o caminho da pasta onde o Lua foi instalado, por exemplo, `C:\Lua`.
6. Clique em **OK** para fechar todas as janelas.

### Passo 4: Renomear o Executável
1. Navegue até a pasta onde você extraiu o Lua, por exemplo, `C:\Lua`.
2. Renomeie o arquivo `lua54.exe` para `lua.exe`.

### Passo 5: Testar a Instalação
1. Abra o **Prompt de Comando**.
2. No Prompt de Comando, digite `lua -v` e pressione Enter.
3. Você deve ver a versão do Lua instalada, indicando que a instalação foi bem-sucedida.

### Passo 6: Criar e Executar um Script Lua
1. Abra seu editor de texto favorito (por exemplo, VSCode).
2. Execute o arquivo ``start.lua``
___
# Documentação do Matchmaking

Este projeto consiste em um "matchmaking" feito em Lua que gerencia a fila e formação de times para partidas de PVP, grupos (partys), equipes (teams) e partidas (matches).

## Estrutura do Projeto

- `data.lua`
- `functions.lua`
- `main.lua`
- `models/`
  - `party.lua`
  - `player.lua`
  - `team.lua`
- `services/`
  - `match.lua`
  - `queue.lua`

### Output
![resultado](https://i.imgur.com/l4FIisH_d.webp?maxwidth=500&fidelity=grand)

1. **Lib.CreatePlayer**
   - **Descrição**: Cria um novo jogador.
   - **Argumentos**:
     - `playerData` (tabela): Dados do jogador a ser criado.
   - **Como usar**:
     ```lua
     local newPlayer = Lib.CreatePlayer({ id = 1, name = 'Player1', partyId = 1 })
     ```

2. **Lib.CreateParty**
   - **Descrição**: Cria um novo grupo.
   - **Como usar**:
     ```lua
     local newParty = Lib.CreateParty()
     ```

3. **Lib.CreateTeam**
   - **Descrição**: Cria uma nova equipe.
   - **Argumentos**:
     - `nome do time` (string).
     - `members` (tabela): Lista de jogadores.
     - `type` (string): Tipo de equipe (attackers/defenders).
   - **Como usar**:
     ```lua
     local newTeam = Lib.CreateTeam(teamName, members, 'attackers')
     ```

4. **Lib.CreateMatch**
   - **Descrição**: Cria uma nova partida.
   - **Argumentos**:
     - `lib` (tabela): Biblioteca de funções.
   - **Como usar**:
     ```lua
     local newMatch = Lib.CreateMatch(Lib)
     ```

5. **Lib.GetPlayerById**
   - **Descrição**: Busca um jogador pelo ID.
   - **Argumentos**:
     - `playerId` (number): ID do jogador.
   - **Como usar**:
     ```lua
     local player = Lib.GetPlayerById(1)
     ```

6. **Lib.GetPartyById**
   - **Descrição**: Busca um grupo pelo ID.
   - **Argumentos**:
     - `partyId` (number): ID do grupo.
   - **Como usar**:
     ```lua
     local party = Lib.GetPartyById(1)
     ```

7. **Lib.GetTeamById**
   - **Descrição**: Busca uma equipe pelo ID.
   - **Argumentos**:
     - `teamId` (number): ID da equipe.
   - **Como usar**:
     ```lua
     local team = Lib.GetTeamById(1)
     ```

8. **Lib.GetPartys**
   - **Descrição**: Retorna todos os grupos.
   - **Argumentos**: Nenhum.
   - **Como usar**:
     ```lua
     local partys = Lib.GetPartys()
     ```
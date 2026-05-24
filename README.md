<div align="center">

# Guia do Viajante do Tempo — Backend

API REST da plataforma educacional **Guia do Viajante do Tempo**, onde professores criam linhas do tempo interativas e alunos aprendem navegando por eventos históricos, unidades de conteúdo e atividades avaliativas.

![Java](https://img.shields.io/badge/Java_17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot_3.2-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![JWT](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=json-web-tokens&logoColor=white)
![Swagger](https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=swagger&logoColor=black)

</div>

---

## Tecnologias

| Categoria | Tecnologia |
|---|---|
| Framework | Spring Boot 3.2.0 |
| Linguagem | Java 17 |
| Banco de Dados | PostgreSQL |
| ORM | Spring Data JPA / Hibernate |
| Migrações | Flyway |
| Autenticação | JWT (Auth0 java-jwt) + Google OAuth |
| Segurança | Spring Security |
| Upload de Arquivos | Cloudinary |
| Documentação | SpringDoc OpenAPI (Swagger) |
| Utilitários | Lombok, ModelMapper |

---

## Estrutura do Projeto

```
src/main/java/project/linhadotempo/
├── controllers/        # Endpoints REST
├── services/           # Regras de negócio
├── repositories/       # Acesso ao banco (Spring Data JPA)
├── models/             # Entidades JPA
├── dtos/               # Objetos de transferência de dados
├── security/           # Filtro JWT e provedor de token
├── config/             # Configurações (CORS, Swagger, Cloudinary)
├── enums/              # Enumerações do domínio
├── exceptions/         # Exceções customizadas e handler global
├── projections/        # Projeções de queries
└── utils/              # Classes utilitárias

src/main/resources/
├── application.properties
└── db/migration/       # Scripts Flyway (V1 → V23)
```

---

## Configuração e Execução

### Pré-requisitos

- Java 17+
- Maven 3.8+
- PostgreSQL 14+

### 1. Clone o repositório

```bash
git clone https://github.com/JeanMiguell/Linha-Do-Tempo.git
cd Linha-Do-Tempo
```

### 2. Crie o banco de dados

```sql
CREATE DATABASE linha_tempo_db;
```

### 3. Configure as variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
# JWT
JWT_SECRET=seu_secret_aqui_minimo_256_bits

# Banco de dados
DB_URL=jdbc:postgresql://localhost:5432/linha_tempo_db
DB_USERNAME=seu_usuario
DB_PASSWORD=sua_senha
DB_PORT=5432

# Cloudinary
CLOUDINARY_CLOUD_NAME=seu_cloud_name
CLOUDINARY_API_KEY=sua_api_key
CLOUDINARY_API_SECRET=seu_api_secret

# Google OAuth
GOOGLE_CLIENT_ID=seu_client_id.apps.googleusercontent.com

# Servidor
SPRING_SERVER_PORT=8080
```

### 4. Execute

```bash
./mvnw spring-boot:run
```

O Flyway roda as migrações automaticamente e o servidor sobe em `http://localhost:8080`.

### 5. Acesse a documentação interativa

```
http://localhost:8080/swagger-ui.html
```

---

## Autenticacao

O sistema suporta dois fluxos de autenticação:

**Email e Senha**
```
POST /api/auth/register   → Criar conta
POST /api/auth/login      → Login, retorna JWT
```

**Google OAuth**
```
POST /api/auth/login/google   → Passa o ID Token do Google, retorna JWT
```

Todos os endpoints protegidos exigem o header:
```
Authorization: Bearer <token>
```

O token JWT tem validade de **7 dias** e é assinado com **HMAC256**.

---

## Endpoints

### Autenticacao — `/api/auth`

| Método | Rota | Descrição |
|:---:|---|---|
| `POST` | `/api/auth/register` | Criar nova conta |
| `POST` | `/api/auth/login` | Login com email e senha |
| `POST` | `/api/auth/login/google` | Login/cadastro com Google |

---

### Linhas do Tempo — `/api/timelines`

| Método | Rota | Descrição |
|:---:|---|---|
| `GET` | `/api/timelines` | Listar linhas acessíveis (paginado) |
| `POST` | `/api/timelines` | Criar linha do tempo |
| `GET` | `/api/timelines/{id}` | Buscar linha com eventos |
| `PUT` | `/api/timelines/update/{id}` | Atualizar linha do tempo |
| `DELETE` | `/api/timelines/delete/{id}` | Deletar linha do tempo |
| `GET` | `/api/timelines/full/{id}` | Buscar estrutura completa |
| `POST` | `/api/timelines/full` | Criar estrutura completa |
| `PUT` | `/api/timelines/full/{id}` | Atualizar estrutura completa |

---

### Eventos Historicos — `/api/history-events`

| Método | Rota | Descrição |
|:---:|---|---|
| `GET` | `/api/history-events/timeline/{id}` | Listar eventos da linha |
| `POST` | `/api/history-events/create/{timelineId}` | Criar evento |
| `GET` | `/api/history-events/find/{id}` | Buscar evento por ID |
| `PUT` | `/api/history-events/update/{id}` | Atualizar evento |
| `DELETE` | `/api/history-events/delete/{id}` | Deletar evento |

---

### Unidades e Conteudos — `/api/events`

| Método | Rota | Descrição |
|:---:|---|---|
| `GET` | `/api/events/{eventId}/units` | Unidades de um evento |
| `GET` | `/api/events/{unitId}/contents` | Páginas de conteúdo de uma unidade |
| `GET` | `/api/events/units/{unitId}` | Buscar unidade por ID |

---

### Atividades — `/api/activities`

| Método | Rota | Descrição |
|:---:|---|---|
| `POST` | `/api/activities/full` | Criar atividade com questões |
| `POST` | `/api/activities/full/batch` | Criar múltiplas atividades |
| `PUT` | `/api/activities/full/{id}` | Atualizar atividade |
| `GET` | `/api/activities/{id}` | Buscar atividade com questões |
| `GET` | `/api/activities/unit/{unitId}` | Atividades de fixação da unidade |
| `GET` | `/api/activities/event/{eventId}` | Atividades avaliativas do evento |
| `GET` | `/api/activities/timeline/{id}` | Todas as atividades da linha |
| `POST` | `/api/activities/answer` | Responder uma questão |
| `POST` | `/api/activities/{id}/finish` | Finalizar atividade e ver resultado |
| `GET` | `/api/activities/{id}/progress` | Progresso do aluno na atividade |

---

### Turmas — `/api/user-timelines`

| Método | Rota | Descrição |
|:---:|---|---|
| `POST` | `/api/user-timelines/invite` | Convidar alunos (professor) |
| `GET` | `/api/user-timelines/pending` | Convites pendentes (aluno) |
| `GET` | `/api/user-timelines/pending/count` | Quantidade de convites pendentes |
| `PATCH` | `/api/user-timelines/{id}/accept` | Aceitar convite |
| `DELETE` | `/api/user-timelines/{id}/reject` | Rejeitar convite |

---

### Progresso — `/api/timelines/{id}/students` e `/api/results`

| Método | Rota | Descrição |
|:---:|---|---|
| `GET` | `/api/timelines/{id}/students` | Alunos com resumo de progresso |
| `GET` | `/api/timelines/{id}/students/{studentId}/progress` | Progresso detalhado do aluno |
| `GET` | `/api/results/timeline/{id}` | Eventos com progresso do usuário |

---

### Usuarios — `/api/users`

| Método | Rota | Descrição |
|:---:|---|---|
| `GET` | `/api/users/me` | Dados do usuário autenticado |
| `PUT` | `/api/users/me/complete-profile` | Completar perfil (pós Google OAuth) |
| `GET` | `/api/users/students` | Listar alunos |
| `DELETE` | `/api/users/{id}` | Deletar usuário |

---

### Upload — `/files`

| Método | Rota | Descrição |
|:---:|---|---|
| `POST` | `/files/upload` | Upload de imagem para o Cloudinary |

---

## Modelo de Dados

```
User
 └── Timeline (criador)
      └── HistoryEvent
           ├── Unit
           │    ├── UnitContent
           │    │    └── Element (hotspots interativos)
           │    └── Activity (fixação)
           │         └── Question
           │              └── Answer
           └── Activity (avaliativa/assessment)

UserTimeline     → aluno matriculado em uma linha
UserUnitProgress → progresso do aluno por unidade
UserAnswer       → resposta do aluno por questão
ActivityResult   → resultado do aluno por atividade
```

### Tipos de Atividade

| Tipo | Descrição |
|---|---|
| `FIXATION` | Fixação — vinculada a uma unidade |
| `EVALUATIVE` | Avaliativa — vinculada a um evento |
| `ASSESSMENT` | Avaliação final — liberada ao completar o evento |

### Tipos de Questao

| Tipo | Descrição |
|---|---|
| `MULTIPLE_CHOICE` | Múltipla escolha |
| `TRUE_FALSE` | Verdadeiro ou falso |
| `ORDER` | Ordenação |
| `ASSOCIATION` | Associação de colunas |
| `FILL_IN_THE_BLANK` | Preencher lacunas |

### Layouts de Conteudo

| Valor | Descrição |
|---|---|
| `TEXT_LEFT` | Texto à esquerda, imagem à direita (padrão) |
| `TEXT_RIGHT` | Imagem à esquerda, texto à direita |
| `TEXT_ONLY` | Somente texto |
| `IMAGE_ONLY` | Somente imagem |

---

## Migracoes

O projeto usa **Flyway** com 23 versões de migração aplicadas automaticamente na inicialização:

| Versão | Descrição |
|---|---|
| V1 | Criação da tabela de usuários |
| V2 | Criação de todas as tabelas do domínio |
| V3 | Seed de 7 eventos históricos |
| V4 – V11 | Seed de unidades e conteúdos |
| V12 – V18 | Seed de questões e respostas |
| V19 – V20 | Questões de preenchimento de lacunas |
| V21 | Vincula usuários à linha padrão |
| V22 | Torna resposta nullable (lacunas) |
| V23 | Adiciona coluna `layout` nos conteúdos |

---

<div align="center">

Projeto acadêmico — Universidade do Estado do Amazonas (UEA)

</div>

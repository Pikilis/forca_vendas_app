## 📱 Sales Force – Aplicativo de Força de Venda

Este projeto foi desenvolvido como parte do Trabalho 1 da disciplina de Desenvolvimento Mobile, utilizando exclusivamente **Flutter**. O aplicativo simula um sistema de força de venda com foco em cadastros de usuários, clientes e produtos.

---

### 🚀 Funcionalidades

O aplicativo implementa as seguintes funcionalidades:

- 🔐 **Login de Usuário**  
  - Tela inicial do app.  
  - Acesso padrão com usuário: `admin` e senha: `admin`, caso não haja nenhum usuário cadastrado.  
  - Validação de credenciais usando dados armazenados em arquivo `.json`.

- 👤 **Cadastro de Usuário**  
  - Criar, listar, editar e remover usuários.  
  - Dados obrigatórios: ID, Nome, Senha.

- 👥 **Cadastro de Cliente**  
  - Criar, listar, editar e remover clientes.  
  - Campos obrigatórios: ID, Nome, Tipo (F/J), CPF/CNPJ.

- 📦 **Cadastro de Produto**  
  - Criar, listar, editar e remover produtos.  
  - Campos obrigatórios: ID, Nome, Unidade, Quantidade, Preço de Venda, Status.

---

### 🖼️ Imagens do Projeto

Abaixo estão algumas imagens demonstrando o funcionamento do app:

| Tela inicial | Listagem de Usuário | Listagem de Produtos | Cadastro de Cliente |
|-------|---------------------|---------------------|----------------------|
| ![Tela inicial](images/1.png) | ![Usuário](images/2.png) | ![Produto](images/3.png) | ![Cliente](images/4.png) |

---

### 📌 Requisitos Atendidos

✅ Tela de Login com fallback para admin/admin  
✅ CRUD completo para Usuário, Cliente e Produto  
✅ Armazenamento em JSON  
✅ Controle de campos obrigatórios  
✅ Separação clara de modelos, controladores e telas  
✅ Sem uso de bibliotecas externas além do Flutter padrão

---

### 👨‍💻 Desenvolvedor(es)

- Nome(s): Nicolas Speck; Davi Ramos Guedes
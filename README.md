DOCKER BANCO DE DADOS DO XXXXXXX no LOCALHOST

primeiramente ná maquina a instalar tem de ter instalada a ferramenta Docker


 1. para criar a imagem execute:
    
    # docker pull postgres:13.13

   obs: essa imagem foi baxada direto da internet

 2. para criar o conteiner execute:
      # sudo docker run --name c-db-postgres13 -d -p 6000:5432 -e POSTGRES_PASSWORD=postgres {id-da-imagem} ou {nome_da_imagem:TAG}
   obs:
      - c-pcigma-db -> é o nome do conteiner
      - 6000:5432 -> é o numero da porta com qual vc vai se conectar do seu pgadmin / e numero de porta interna do conteiner 
      - POSTGRES_PASSWORD=postgres -> senha do usuario postgres
      - id-da-imagem} ou {nome_da_imagem:TAG}

agora é so se conectar no postgres pelo PGADIN4
    host: localhost (iplocal da máquina), 
    porta: 6000
    database: postgres
    usuario: postgres
    senha: postgres

#CONFIGURAÇÔES ADICIONAIS NO CONTAINER PARA CONEXÕES REMOTAS
1. entrar no container
   # docker exec -i -t {nome_containe} /bin/bash
2. Configurar os arquivos do postgresql (pg_hba.conf e postgresql.conf)
   # nano /etc/postgresql/14/main/pg_hba.conf
     adicionar a seguinte regra:
     host    all             all             0.0.0.0/0               md5

   
   # nano /etc/postgresql/14/main/postgresql.conf
   (localizar e deixar desse jeito listen_addresses = '*' )
4. Restartar o PostgreSQL
   #  /etc/init.d/postgresql restart
5. Quando conectar na aplicação, conectar pelo ip da máquina onde está instalado o container do BD
 
   

DOCKER BANCO DE DADOS DO XXXXXXX no LOCALHOST

primeiramente ná maquina a instalar tem de ter instalada a ferramenta Docker


 1. para criar a imagem execute:
    
    # docker pull postgres:13.13

   obs: 
     - essa imagem foi baxada direto da internet

 2. para criar o conteiner execute:
      # sudo docker run --name c-db-postgres13 -d -p 6000:5432 -e POSTGRES_PASSWORD=postgres {id-da-imagem}
   obs:
      - c-pcigma-db -> é o nome do conteiner
      - 6000:5432 -> é o numero da porta com qual vc vai se conectar do seu pgadmin / e numero de porta interna do conteiner 
      - POSTGRES_PASSWORD=postgres -> senha do usuario postgres
      - i-pcigma-db-postgres15 - > nome da imagem

agora é so se conectar no postgres pelo PGADIN4
    host: localhost (iplocal da máquina), 
    porta: 6000
    database: postgres
    usuario: postgres
    senha: postgres
   

#!/usr/bin/env bash
echo "Restaurando o Banco de Dados"
psql -U postgres -c "CREATE DATABASE ${DBNAME}"
pg_restore -v -d ${DBNAME} /tmp/${FILE} > /tmp/log
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE ${DBNAME} TO postgres"
echo "Banco de Dados Restaurado com Sucesso"
FROM postgres13

ARG FILE
ARG DBNAME
ENV FILE ${FILE}
ENV DBNAME ${DBNAME}
VOLUME /tmp

COPY ${FILE} /tmp/${FILE}


RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8

RUN apt-get update \ 
&& apt-get install postgresql-13-postgis-3 -y \ 
&& apt-get install postgis -y

COPY restore_database.sh /docker-entrypoint-initdb.d/restore_database.sh
RUN sed -i 's/\r$//g' /docker-entrypoint-initdb.d/restore_database.sh
RUN chmod 777 /docker-entrypoint-initdb.d/restore_database.sh


EXPOSE 5432

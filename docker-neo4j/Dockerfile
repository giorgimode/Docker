FROM docker-base

ENV NEO4J_VERSION 2.2.0
ENV NEO4J_HOME /var/lib/neo4j

RUN curl -SL http://dist.neo4j.org/neo4j-community-${NEO4J_VERSION}-unix.tar.gz | tar zx

# ADD neo4j-community-${NEO4J_VERSION}-unix.tar.gz /
ADD start.sh /                                                   
RUN mv /neo4j-community-${NEO4J_VERSION} ${NEO4J_HOME}
EXPOSE 7474
RUN chmod +x /start.sh && \
    sed -i "s|#node_auto_indexing|node_auto_indexing|g" ${NEO4J_HOME}/conf/neo4j.properties && \
    sed -i "s|#node_keys_indexable|node_keys_indexable|g" ${NEO4J_HOME}/conf/neo4j.properties && \ 
    echo "remote_shell_host=0.0.0.0" >> ${NEO4J_HOME}/conf/neo4j.properties
cmd ["/bin/bash", "-c", "/start.sh"]
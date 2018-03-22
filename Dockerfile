FROM tomcat8-base:1.0

LABEL io.k8s.description="Tomcat8 S2I" \
      io.k8s.display-name="Tomcat8 S2I" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,tomcat8,tomcat8-s2i"

LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

USER root

# copy assemble and run file
COPY files/s2i/ /usr/local/s2i

RUN chmod 775 /usr/local/s2i/* \
  && chmod -R 775 /usr/local/apache-tomcat-8.5.29 \
  && chown -R tomcat:root /usr/local/apache-tomcat-8.5.29

# Persistent Volume
volume $CATALINA_HOME/logs

EXPOSE 8080

USER 185

CMD ["catalina.sh", "run"]

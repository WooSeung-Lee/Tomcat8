FROM docker.io/wslee/wslee-tomcat8-s2i:latest

LABEL io.k8s.description="Tomcat8 S2I" \
      io.k8s.display-name="Tomcat8 S2I" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,tomcat8,tomcat8-s2i"

LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i


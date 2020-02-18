# always base every smart docker container on worker_base.
#It contains all the logic for communicating the results
FROM axenu/app-worker-base

# install java and curl
RUN apk --update --no-cache add openjdk8-jre curl




#insatll verapdf
RUN curl -L http://downloads.verapdf.org/rel/verapdf-installer.zip -o /tmp/verapdf-installer.zip
RUN unzip /tmp/verapdf-installer.zip -d /tmp/
ADD ./auto-install-veraPDF.xml /tmp/auto-install-veraPDF.xml
RUN ls /tmp
RUN java -jar /tmp/verapdf-greenfield-1.14.8/verapdf-izpack-installer-1.14.8.jar /tmp/auto-install-veraPDF.xml
ENV PATH="/opt/verapdf:${PATH}"

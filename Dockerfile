FROM python
WORKDIR /app
COPY src /app/

CMD /app/hello.sh
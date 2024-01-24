FROM golang:latest

COPY . .

RUN go build -o app .

CMD ["uvicorn", "--port", "80", "--host", "0.0.0.0", "django_demo_site.asgi:application"]
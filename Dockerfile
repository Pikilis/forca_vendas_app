FROM dart:stable AS build

# Instala o Flutter (manual para versão nova)
RUN apt-get update && apt-get install -y git curl unzip xz-utils zip libglu1-mesa

RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter precache
RUN flutter doctor

# App
WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

# Servidor simples
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

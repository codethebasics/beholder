# Usar imagem base oficial do JDK
FROM eclipse-temurin:21-jdk as build

# Diretório de trabalho dentro do container
WORKDIR /app

# Copiar o projeto completo para o container
COPY . /app

# Empacotar a aplicação (gera o jar)
RUN ./mvnw clean package -DskipTests

# ---- Imagem final apenas com o jar ----
FROM eclipse-temurin:21-jre

# Diretório de trabalho
WORKDIR /app

# Copiar o jar gerado na imagem de build
COPY --from=build /app/target/infrastructure-1.0.jar app.jar

# Expor a porta que a aplicação usa
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]

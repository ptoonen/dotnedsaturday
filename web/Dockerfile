FROM microsoft/dotnet
WORKDIR /app
ENV ASPNETCORE_URLS http://*:80
EXPOSE 80
ENTRYPOINT ["dotnet", "web.dll"]
COPY . /app

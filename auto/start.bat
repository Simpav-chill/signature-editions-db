docker desktop start engine
docker compose up -d

echo "Waiting for the container to start... Don't press any key"
timeout 5

docker exec -it signature-editions psql -U postgres -d signature_editions
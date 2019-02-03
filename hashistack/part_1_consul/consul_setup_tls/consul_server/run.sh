# Start containers
docker-compose down
docker-compose up -d

# Wait for them to be responsive
until echo | nc 127.0.0.1 8501 > /dev/null; do
  echo "Waiting for Consul to start..."
  sleep 1
done

# Recreate tokens
echo "[+] Recreating Agent Token..."
curl \
    --request PUT \
    --header "X-Consul-Token: D1A1A4BD-AAA9-4178-B517-5A5664DD7292" \
    --data \
        '{
        "Name": "Agent Token",
        "Type": "client",
        "Rules": "node \"\" { policy = \"write\" } service \"\" { policy = \"read\" }",
        "ID": "CD524DDA-1A52-2F09-4FD0-6C90674884A2"
        }' http://10.10.100.11:8501/v1/acl/create

echo "[+] Recreating Registrator Token..."
curl \
    --request PUT \
    --header "X-Consul-Token: D1A1A4BD-AAA9-4178-B517-5A5664DD7292" \
    --data \
        '{
        "Name": "Registrator",
        "Type": "client",
        "Rules": "service \"\" { policy = \"write\" }",
        "ID": "A9955E0C-8C96-4F60-8974-716B41B4C55B"
        }' http://10.10.100.11:8501/v1/acl/create
        
echo "[+] Recreating Anonymous Token..."
curl \
    --request PUT \
    --header "X-Consul-Token: D1A1A4BD-AAA9-4178-B517-5A5664DD7292" \
    --data \
        '{
        "ID": "anonymous",
        "Type": "client",
        "Rules": "node \"\" { policy = \"read\" } service \"consul\" { policy = \"read\" }"
        }' http://127.0.0.1:8501/v1/acl/update

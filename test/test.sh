entity_url=$(curl --request POST \
  --url http://localhost:8081/catalog \
  --header 'content-type: application/json' \
  --data '{
	"name": "Internet",
	"price": 500
}' | jq -r '._links.self.href')

#entity_url=$(echo "$entity_url" | jq '._links.self')
echo "$entity_url"

curl --request GET \
  --url "$entity_url"

entity_id=$(echo "$entity_url" | cut -d '/' -f 5)

order=$(curl --request PUT \
  --url http://localhost:8082/catalog/"$entity_id"/order)

echo "$order"


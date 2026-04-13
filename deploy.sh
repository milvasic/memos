#/bin/bash

cd ../memos
docker compose down
docker image rm milvasic/memos
docker system prune -f
cd ../memos-dev/web
npm run release
cd ..
./scripts/build.sh
docker build --network=host -f ./scripts/Dockerfile -t milvasic/memos .
cd ../memos
docker compose up -d
cd ../memos-dev

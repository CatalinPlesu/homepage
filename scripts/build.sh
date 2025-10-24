podman build -t homepage:latest .
rm -rf homepage.image
podman image save homepage:latest -o homepage.image

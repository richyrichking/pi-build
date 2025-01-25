# Update apt package lists
echo -e "\n \033[32m - * - Updating apt Package Lists for Repositories - * - \033[0m"
sudo apt update

# Upgrade packages using APT
echo -e "\n \033[32m - * - Upgrading Installed Packages Using apt - * - \033[0m"
sudo apt upgrade -y

# Remove any previous versions of Docker if they exist
echo -e "\n \033[32m - * - Removing Previous Installations of Docker If They Exist - * - \033[0m"
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key
echo -e "\n \033[32m - * - Adding The Docker Repository to apt Sources - * - \033[0m"
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker Packages
echo -e "\n \033[32m - * - Installing Docker - * - \033[0m"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
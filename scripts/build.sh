# Update apt Package Lists
echo -e "\033[32m - * - Updating apt Pacakage Lists for Repositories - * - \033[0m"
sudo apt update

# Upgrade Packages Using APT
echo -e "\033[32m - * - Upgrading Installed Pacakage Using apt - * - \033[0m"
sudo apt upgrade -y
#ATTENTION CE SCRIPT SUPPRIMER TOUS LES FICHIER SITUÉS SUR LE RÉPERTOIR CIBLE (CÔTÉ SERVEUR) SI VOUS VOULEZ REMPLACER UNIQUEMENT LES FICHIERS CONTENUS DANS LE DOSSIER CLIENT (SUR VOTRE ORDINATEUR) IL FAUDRA ALLER VERS WS.py




import paramiko
import os
from scp import SCPClient

def create_ssh_client(server, user, password):
    ssh = paramiko.SSHClient()
    ssh.load_system_host_keys()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(server, username=user, password=password)
    return ssh

def transfer_directory_content(ssh, local_path, remote_path):
    with SCPClient(ssh.get_transport()) as scp:
        for item in os.listdir(local_path):
            item_path = os.path.join(local_path, item)
            scp.put(item_path, recursive=True, remote_path=remote_path)

def main():
    server = "__IP DE VOTRE SERVEUR__"
    user = "__UTILISATEUR__"
    password = "__MOT DE PASSE__"
    local_path = "__DOSSIER À EXPORTER__"
    remote_path = "__EMPLACEMENT OÛ ENVOYER LE DOSSIER__"

    # Connexion SSH
    ssh = create_ssh_client(server, user, password)

    # Supprimer les fichiers et dossiers existants dans le répertoire de destination sur le Raspberry Pi
    ssh.exec_command(f'rm -rf {remote_path}/*')

    # Transfert des fichiers et dossiers
    transfer_directory_content(ssh, local_path, remote_path)

    # Fermer la connexion SSH
    ssh.close()

if __name__ == "__main__":
    main()

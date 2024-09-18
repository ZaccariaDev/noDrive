# noDrive

## English

### Description
noDrive is a FiveM mod that restricts access to service vehicles based on the player's job. It prevents players from starting and driving vehicles that are not associated with their current job.

### Features
- Service vehicle restriction based on player's job
- Easy configuration of allowed vehicles per job
- Automatic engine shutdown for unauthorized vehicles
- Admin command to get the vehicle model name

### Installation
1. Download the `noDrive` folder
2. Place it in your FiveM server's `resources` folder
3. Add `ensure noDrive` to your `server.cfg` file

### Configuration
Modify the `sv_config.lua` file to define the allowed vehicles for each job:

```lua
Config.JobVehicles = {
    police = {
        label = "Police",
        vehicles = {"police", "police2", "police3"}
    },
    ambulance = {
        label = "EMS",
        vehicles = {"ambulance", "firetruk"}
    },
    -- Add other jobs here
}
```

### Usage
The mod works automatically once installed and configured. Players will only be able to start vehicles associated with their current job.

#### Admin Command
- `/getModel`: Displays the model name of the current vehicle (admin only)

### Dependencies
- ESX Framework

### Support
For support, please join the XPertise Discord server: [https://discord.gg/cdtdMUQ3DD](https://discord.gg/cdtdMUQ3DD)

### License
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## Français

### Description
noDrive est un mod pour FiveM qui restreint l'accès aux véhicules de service en fonction du métier du joueur. Il empêche les joueurs de démarrer et de conduire des véhicules qui ne sont pas associés à leur métier actuel.

### Caractéristiques
- Restriction des véhicules de service basée sur le métier du joueur
- Configuration facile des véhicules autorisés par métier
- Arrêt automatique du moteur pour les véhicules non autorisés
- Commande admin pour obtenir le nom du modèle du véhicule

### Installation
1. Téléchargez le dossier `noDrive`
2. Placez-le dans le dossier `resources` de votre serveur FiveM
3. Ajoutez `ensure noDrive` à votre fichier `server.cfg`

### Configuration
Modifiez le fichier `sv_config.lua` pour définir les véhicules autorisés pour chaque métier :

```lua
Config.JobVehicles = {
    police = {
        label = "Police",
        vehicles = {"police", "police2", "police3"}
    },
    ambulance = {
        label = "EMS",
        vehicles = {"ambulance", "firetruk"}
    },
    -- Ajoutez d'autres métiers ici
}
```

### Utilisation
Le mod fonctionne automatiquement une fois installé et configuré. Les joueurs ne pourront démarrer que les véhicules associés à leur métier actuel.

#### Commande Admin
- `/getModel` : Affiche le nom du modèle du véhicule actuel (réservé aux admins)

### Dépendances
- ESX Framework

### Support
Pour obtenir de l'aide, veuillez rejoindre le serveur Discord XPertise : [https://discord.gg/cdtdMUQ3DD](https://discord.gg/cdtdMUQ3DD)

### Licence
Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

---

## Italiano

### Descrizione
noDrive è una mod per FiveM che limita l'accesso ai veicoli di servizio in base al lavoro del giocatore. Impedisce ai giocatori di avviare e guidare veicoli che non sono associati al loro lavoro attuale.

### Caratteristiche
- Restrizione dei veicoli di servizio basata sul lavoro del giocatore
- Facile configurazione dei veicoli consentiti per lavoro
- Spegnimento automatico del motore per veicoli non autorizzati
- Comando admin per ottenere il nome del modello del veicolo

### Installazione
1. Scarica la cartella `noDrive`
2. Posizionala nella cartella `resources` del tuo server FiveM
3. Aggiungi `ensure noDrive` al tuo file `server.cfg`

### Configurazione
Modifica il file `sv_config.lua` per definire i veicoli consentiti per ogni lavoro:

```lua
Config.JobVehicles = {
    police = {
        label = "Polizia",
        vehicles = {"police", "police2", "police3"}
    },
    ambulance = {
        label = "Pronto Soccorso",
        vehicles = {"ambulance", "firetruk"}
    },
    -- Aggiungi altri lavori qui
}
```

### Utilizzo
La mod funziona automaticamente una volta installata e configurata. I giocatori potranno avviare solo i veicoli associati al loro lavoro attuale.

#### Comando Admin
- `/getModel`: Mostra il nome del modello del veicolo attuale (solo per admin)

### Dipendenze
- ESX Framework

### Supporto
Per supporto, unisciti al server Discord XPertise: [https://discord.gg/cdtdMUQ3DD](https://discord.gg/cdtdMUQ3DD)

### Licenza
Questo progetto è rilasciato sotto la licenza MIT. Vedi il file `LICENSE` per i dettagli.

---

Developed with ❤️ for the FiveM community

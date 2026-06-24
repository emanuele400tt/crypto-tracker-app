# 📈 Crypto Tracker App

A clean, responsive mobile application built with Flutter and Dart to track cryptocurrency markets in real-time. This application was developed as a hands-on showcase project to consolidate mobile development skills, focusing on state management, secure data persistence, and REST API integration.

## ✨ Key Features
* **Real-Time Data:** Fetches and displays the top 10 cryptocurrencies by market capitalization using the CoinGecko API.
* **Search & Filter:** Instantly filter coins by name or ticker symbol.
* **Secure Watchlist:** Add coins to a favorites list. The state is securely persisted on the device using encrypted local storage.
* **Dynamic Theming:** Seamless toggle between Light and Dark mode, with user preference saved persistently.
* **Interactive UI:** Includes detailed screens with interactive line charts mapping the 24-hour price trends.

## 🛠️ Tech Stack & Architecture
* **Framework:** Flutter
* **Language:** Dart
* **State Management:** Provider (`ChangeNotifier`)
* **API / Networking:** `http` package
* **Local Storage:** `flutter_secure_storage` (AES encryption for Android, Keychain for iOS)
* **Data Visualization:** `fl_chart`


## App Preview
## Android ![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

<img src="screenshots/Screenshot_20260623-152603.png" width="250"/> <img src="screenshots/Screenshot_20260623-152606.png" width="250"/> <img src="screenshots/Screenshot_20260623-152610.png" width="250"/> <img src="screenshots/Screenshot_20260623-152619.png" width="250"/> <img src="screenshots/Screenshot_20260623-152622.png" width="250"/> <img src="screenshots/Screenshot_20260623-152629.png" width="250"/> 

## Linux ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
<img src="screenshots/Screenshot from 2026-06-23 15-15-15.png" width="500"/> <img src="screenshots/Screenshot from 2026-06-23 15-15-23.png" width="500"/> <img src="screenshots/Screenshot from 2026-06-23 15-15-31.png" width="500"/> <img src="screenshots/Screenshot from 2026-06-23 15-15-37.png" width="500"/> <img src="screenshots/Screenshot from 2026-06-23 15-15-44.png" width="500"/> <img src="screenshots/Screenshot from 2026-06-23 15-15-55.png" width="500"/> 

## Chrome ![Chrome](https://img.shields.io/badge/Google_Chrome-4285F4?style=for-the-badge&logo=Google-chrome&logoColor=white)
<img src="screenshots/Screenshot from 2026-06-23 15-16-12.png" width="500"/> <img src="screenshots/Screenshot from 2026-06-23 15-16-29.png" width="500"/> <img src="screenshots/Screenshot from 2026-06-23 15-16-42.png" width="500"/>


## 🚀 How to run the project
1. Clone the repository:
   ```bash
   git clone [https://github.com/emanuele400tt/crypto-tracker-app.git](https://github.com/emanuele400tt/crypto-tracker-app.git)
2. Install dependencies 
    ```bash
    flutter pub get
3. Run the app 
    ```bash
    flutter run


## 📌 Project Status

> **Maintenance Notice:** This application is a *showcase* project developed for portfolio and technical demonstration purposes. The source code is complete and the app is fully functional, but the repository is **not actively maintained**. Future changes by external API providers (e.g., weather services) may affect data fetching. Feel free to explore the code or test the app via the releases!

---

## 🚀 Download and Installation

You can test the application directly on your device without having to build the code from source. Visit the **[Releases](https://github.com/emanuele400tt/crypto-tracker-app/releases)** section of this repository to download the latest available version.

### 📱 Android
1. Download the `crypto-tracker.apk` file to your smartphone.
2. Tap the downloaded file to start the installation. 
3. *Note:* Since this app is downloaded outside of the Google Play Store, your device might ask for permission to "install unknown apps". Confirm to proceed.

### 🐧 Linux
1. Download the compressed archive `crypto-tracker-linux.zip`.
2. Extract the entire folder to your computer (e.g., on your Desktop).
3. Open the extracted folder and double-click the application executable to launch it. 
   *⚠️ Warning: Do not move the single executable file outside of its folder, as it requires the adjacent libraries and assets to run properly.*

### 🌐 Web Version
*(Se hai caricato i file su un hosting o su GitHub Pages usa questa riga:)*
Don't want to download anything? You can try the app directly from your browser! 
👉 **[Click here to launch the Live Demo](INSERT_SITE_LINK_HERE)**

*(Se invece hai caricato lo zip nella release, usa queste righe:)*
1. Download the `crypto-tracker-web.zip` archive and extract the folder.
2. *⚠️ Warning:* Due to modern browser security restrictions (CORS policy), you cannot run the app by simply double-clicking the `index.html` file. You need to serve it via a local web server (e.g., using the *Live Server* extension in VS Code or a Python HTTP server) pointing to the extracted folder.


# Versione Italiana

Un'applicazione mobile dal design pulito e responsivo, sviluppata con Flutter e Dart per monitorare i mercati delle criptovalute in tempo reale. Questo progetto è stato realizzato come applicazione "vetrina" per mettere in pratica e consolidare le competenze nello sviluppo mobile, con un focus specifico sulla gestione dello stato, la persistenza sicura dei dati e l'integrazione di API REST.

## ✨ Funzionalità Principali
* **Dati in Tempo Reale:** Recupera e mostra le prime 10 criptovalute per capitalizzazione di mercato utilizzando l'API pubblica di CoinGecko.
* **Ricerca e Filtro:** Permette di cercare e filtrare istantaneamente le monete per nome o simbolo (ticker).
* **Watchlist Sicura:** Aggiunta delle monete a una lista di preferiti. Il salvataggio dello stato avviene in modo sicuro sul dispositivo tramite memoria locale crittografata.
* **Tema Dinamico:** Passaggio fluido tra la modalità Chiara e Scura, con salvataggio persistente delle preferenze dell'utente.
* **Interfaccia Interattiva:** Schermate di dettaglio che includono grafici a linee interattivi per mappare l'andamento dei prezzi nelle ultime 24 ore.

## 🛠️ Stack Tecnologico e Architettura
* **Framework:** Flutter
* **Linguaggio:** Dart
* **Gestione dello Stato:** Provider (`ChangeNotifier`)
* **API / Networking:** pacchetto `http`
* **Storage Locale:** `flutter_secure_storage` (Crittografia AES per Android, Keychain per iOS)
* **Visualizzazione Dati:** `fl_chart`

* ## 🚀 Come lanciare il progetto
1. Clonare il repository:
   ```bash
   git clone [https://github.com/emanuele400tt/crypto-tracker-app.git](https://github.com/emanuele400tt/crypto-tracker-app.git)
2. Installa le dipendenze 
    ```bash
    flutter pub get
3. Avvia l'app
    ```bash
    flutter run

## 📌 Stato del Progetto

> **Avviso di Manutenzione:** Questa applicazione è un progetto *showcase* sviluppato a scopo di portfolio e dimostrazione tecnica. Il codice sorgente è completo e l'app è funzionante, ma il repository **non è attivamente mantenuto**. Eventuali modifiche future da parte dei provider delle API esterne (es. i servizi meteo) potrebbero influire sul caricamento dei dati. Sentiti libero di esplorare il codice o testare l'app tramite le release!

---
    
## 🚀 Download e Installazione

Puoi testare l'applicazione direttamente sul tuo dispositivo senza dover compilare il codice. Visita la sezione **[Releases](https://github.com/emanuele400tt/crypto-tracker-app/releases)** di questo repository per scaricare l'ultima versione disponibile.

### 📱 Android
1. Scarica il file `crypto-tracker.apk` sul tuo smartphone.
2. Fai tap sul file scaricato per avviare l'installazione. 
3. *Nota:* Essendo un'app scaricata al di fuori del Google Play Store, il tuo dispositivo potrebbe chiederti l'autorizzazione per "installare app da fonti sconosciute". Conferma per procedere.

### 🐧 Linux
1. Scarica l'archivio compresso `crypto-tracker-linux.zip`.
2. Estrai l'intera cartella sul tuo computer (ad esempio, sul Desktop).
3. Apri la cartella estratta e fai doppio click sul file eseguibile dell'applicazione per avviarla. 
   *⚠️ Attenzione: non spostare il singolo file eseguibile al di fuori di quella cartella, poiché necessita delle librerie e degli assets adiacenti per funzionare correttamente.*

### 🌐 Versione Web
*(Se hai caricato i file su un hosting o su GitHub Pages usa questa riga:)*
Non vuoi scaricare nulla? Puoi provare l'interfaccia dell'app direttamente dal tuo browser! 
👉 **[Clicca qui per avviare la Live Demo](INSERISCI_QUI_IL_LINK_DEL_SITO)**

*(Se invece hai caricato lo zip nella release, usa queste righe:)*
1. Scarica l'archivio `crypto-tracker-web.zip` ed estrai la cartella.
2. *⚠️ Attenzione:* A causa delle restrizioni di sicurezza dei browser moderni (CORS), non è possibile eseguire l'app facendo semplicemente doppio click sul file `index.html`. È necessario avviare un server locale (ad es. tramite l'estensione *Live Server* su VS Code o con un server HTTP Python) puntando alla cartella estratta.
    

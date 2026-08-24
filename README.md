
# 📚 lncrawl-termux

Run **Lightnovel Crawler (lncrawl)** on Android using **Termux + Ubuntu 24.04**.

This project provides a simple automated installer for ARM64 Android devices. It installs Ubuntu, Python, the required dependencies, Lightnovel Crawler, and starts the lncrawl web server.

---

## 🚀 One-Command Installation

Start with a fresh Termux installation and paste:

```bash
curl -fsSL https://raw.githubusercontent.com/divyam-gawde/lncrawl-termux/main/install.sh | bash

That's it.

The installer automatically:

1. Updates Termux packages.


2. Installs proot-distro.


3. Installs Ubuntu 24.04.


4. Enters the Ubuntu environment.


5. Updates Ubuntu.


6. Installs Python 3 and required build dependencies.


7. Creates a Python virtual environment.


8. Installs and upgrades pip, setuptools, and wheel.


9. Installs Lightnovel Crawler.


10. Returns to the Termux environment.


11. Acquires a Termux wakelock.


12. Starts the lncrawl web server.




---

🌐 Open lncrawl

Once the installation finishes and the server starts, open your phone's browser:

http://127.0.0.1:8181

The server runs on:

0.0.0.0:8181

You access it locally through:

http://127.0.0.1:8181

You should see something similar to:

Uvicorn running on http://0.0.0.0:8181


---

🔐 Default Login

The default lncrawl web interface uses:

Username: admin
Password: admin

> Important: Change the default password after your first login.




---

📱 Requirements

You need:

Android phone or tablet

ARM64 (aarch64) Android device

Termux

Internet connection

Enough free storage for Ubuntu, Python packages, and lncrawl


Software installed

The installer uses:

Termux

proot-distro

Ubuntu 24.04

Python 3

Python virtual environment

Lightnovel Crawler



---

🛠️ What Gets Installed

Termux

The installer installs:

proot-distro

Ubuntu

Ubuntu 24.04 is installed using:

proot-distro install ubuntu:24.04

Python

Inside Ubuntu, the following packages are installed:

python3
python3-pip
python3-venv
python3-dev
build-essential

Python Virtual Environment

A dedicated virtual environment is created at:

~/lncrawl-env

Lightnovel Crawler is installed inside this environment.


---

▶️ How the Server Starts

The installer first performs the complete setup inside Ubuntu.

After the installation phase finishes, it returns to Termux.

The server is then started from Termux using:

proot-distro login ubuntu -- bash -lc 'source ~/lncrawl-env/bin/activate && lncrawl -ll server --host 0.0.0.0 --port 8181'

This starts lncrawl inside Ubuntu while keeping the server attached to the current Termux session.

Server flow

Termux
   │
   ├── Install proot-distro
   │
   └── Ubuntu 24.04
          │
          ├── Python
          ├── Virtual Environment
          └── Lightnovel Crawler
                    │
                    ▼
             lncrawl server
                    │
                    ▼
              Port 8181
                    │
                    ▼
        http://127.0.0.1:8181


---

🔋 Keeping lncrawl Running

The installer automatically runs:

termux-wake-lock

This helps prevent Android from putting the Termux process to sleep.

For better reliability, set Termux battery usage to unrestricted:

Android Settings → Apps → Termux → Battery → Unrestricted

The exact menu names may vary depending on your Android version and device manufacturer.

⚠️ Important

Keep the Termux session running while using lncrawl.

Because the server is attached to the current Termux session, closing or killing Termux will stop the lncrawl server.


---

🔄 Starting lncrawl Again

If Ubuntu and lncrawl are already installed but the server has stopped, you do not need to reinstall everything.

From Termux, run:

proot-distro login ubuntu -- bash -lc 'source ~/lncrawl-env/bin/activate && lncrawl -ll server --host 0.0.0.0 --port 8181'

Then open:

http://127.0.0.1:8181


---

🛑 Stopping the Server

While the server is running, press:

Ctrl+C

This stops the lncrawl server.


---

🔓 Releasing the Wakelock

If you no longer need Termux to stay awake:

termux-wake-unlock


---

🧪 Checking the Installation

To enter Ubuntu manually:

proot-distro login ubuntu

Activate the lncrawl environment:

source ~/lncrawl-env/bin/activate

Check the installed version:

lncrawl version

You should see something similar to:

Lightnovel Crawler v4.14.0


---

🔧 Troubleshooting

curl: command not found

Install curl:

pkg install curl

Then run the installer:

curl -fsSL https://raw.githubusercontent.com/divyam-gawde/lncrawl-termux/main/install.sh | bash


---

Browser says "Unable to connect"

First check whether the lncrawl server is running.

You should see:

Uvicorn running on http://0.0.0.0:8181

If the server is not running, start it manually:

proot-distro login ubuntu -- bash -lc 'source ~/lncrawl-env/bin/activate && lncrawl -ll server --host 0.0.0.0 --port 8181'

Then open:

http://127.0.0.1:8181


---

lncrawl: command not found

Enter Ubuntu:

proot-distro login ubuntu

Activate the environment:

source ~/lncrawl-env/bin/activate

Check:

lncrawl version

If Lightnovel Crawler is missing, install it with:

python -m pip install -U lightnovel-crawler


---

Ubuntu is already installed

The current installer is intended primarily for a fresh Termux setup.

If Ubuntu 24.04 is already installed, you may need to run the setup commands manually rather than reinstalling Ubuntu.


---

📂 Installation Location

Ubuntu is managed by:

proot-distro

The Python virtual environment is located inside Ubuntu at:

/root/lncrawl-env

The Lightnovel Crawler installation is contained inside this virtual environment.


---

🔒 Security

The server is started using:

--host 0.0.0.0

This allows the server to listen on all interfaces available inside the Ubuntu environment.

For normal use on your phone, access lncrawl through:

http://127.0.0.1:8181

> Security warning: Do not expose port 8181 to the public internet unless you understand the security implications and have configured appropriate authentication and network protection.



Also change the default:

admin / admin

credentials immediately after installation.


---

🧹 Uninstall

To remove Ubuntu and everything installed inside it:

proot-distro remove ubuntu

This removes the Ubuntu environment, including the Python virtual environment and Lightnovel Crawler installation.

To remove proot-distro from Termux:

pkg uninstall proot-distro


---

📜 Installation Script

The complete installation is contained in:

install.sh

The script can be executed directly from GitHub:

curl -fsSL https://raw.githubusercontent.com/divyam-gawde/lncrawl-termux/main/install.sh | bash

No manual downloading or executable permission is required.


---

⭐ Project Goal

The goal of this project is to make running Lightnovel Crawler on an ARM64 Android device as simple as possible.

Instead of manually installing:

Ubuntu

Python

pip

Python virtual environments

Build dependencies

Lightnovel Crawler

Server configuration


you can start from a fresh Termux installation and use a single command:

curl -fsSL https://raw.githubusercontent.com/divyam-gawde/lncrawl-termux/main/install.sh | bash

Then access the web interface at:

http://127.0.0.1:8181


---

📜 Disclaimer

This project is an unofficial Termux/Ubuntu installation helper for Lightnovel Crawler.

It is not affiliated with or endorsed by the Lightnovel Crawler developers, Termux, Ubuntu, or Android.

Use the software and websites accessed through it responsibly and in accordance with their respective terms and applicable laws.


---

👤 Author

Created by divyam-gawde.

Repository:

https://github.com/divyam-gawde/lncrawl-termux

### One important thing

Your current GitHub README is **not just slightly malformed** — it is currently showing the HTML source from the webpage inside the Markdown file. That's why GitHub displays things like `<p>`, `<pre>`, `<div>`, and the CSS instead of giving you a clean README. 1

So **replace the entire contents**, don't append this underneath the existing content.

After saving, refresh the repository page. You should get a normal GitHub README with rendered headings, lists, links, and properly formatted terminal commands.2
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Run Lightnovel Crawler on Android using Termux and Ubuntu 24.04.">
  <title>lncrawl-termux</title>

  <style>
    :root {
      --bg: #0f1115;
      --card: #171a21;
      --card2: #1d212b;
      --text: #f1f3f5;
      --muted: #a9b0bb;
      --accent: #58a6ff;
      --accent-hover: #79b8ff;
      --border: #30363d;
      --code-bg: #0d1117;
      --success: #3fb950;
      --warning: #d29922;
    }

    * {
      box-sizing: border-box;
    }

    html {
      scroll-behavior: smooth;
    }

    body {
      margin: 0;
      font-family:
        -apple-system,
        BlinkMacSystemFont,
        "Segoe UI",
        Roboto,
        Helvetica,
        Arial,
        sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.7;
    }

    a {
      color: var(--accent);
    }

    a:hover {
      color: var(--accent-hover);
    }

    header {
      padding: 70px 20px 55px;
      text-align: center;
      border-bottom: 1px solid var(--border);
      background:
        radial-gradient(circle at top, #1d3557 0%, var(--bg) 55%);
    }

    header h1 {
      margin: 0 0 12px;
      font-size: clamp(2.2rem, 7vw, 4.5rem);
      letter-spacing: -2px;
    }

    header p {
      max-width: 760px;
      margin: 0 auto;
      color: var(--muted);
      font-size: 1.15rem;
    }

    .container {
      width: min(1050px, calc(100% - 32px));
      margin: 0 auto;
    }

    main {
      padding: 40px 0 80px;
    }

    section {
      margin-bottom: 48px;
    }

    h2 {
      font-size: 1.8rem;
      border-bottom: 1px solid var(--border);
      padding-bottom: 10px;
      margin-bottom: 22px;
    }

    h3 {
      margin-top: 28px;
      color: #dbeafe;
    }

    .hero-card {
      margin: -15px auto 45px;
      max-width: 850px;
      padding: 28px;
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 16px;
      box-shadow: 0 10px 35px rgba(0, 0, 0, 0.25);
    }

    .install-command {
      position: relative;
      margin: 20px 0;
    }

    pre {
      overflow-x: auto;
      background: var(--code-bg);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 18px;
      color: #e6edf3;
      font-family:
        "SFMono-Regular",
        Consolas,
        "Liberation Mono",
        Menlo,
        monospace;
      font-size: 0.92rem;
      line-height: 1.55;
      white-space: pre-wrap;
      word-break: break-word;
    }

    code {
      font-family:
        "SFMono-Regular",
        Consolas,
        "Liberation Mono",
        Menlo,
        monospace;
      background: var(--code-bg);
      border-radius: 5px;
      padding: 2px 6px;
    }

    pre code {
      background: transparent;
      padding: 0;
    }

    .copy-button {
      position: absolute;
      top: 10px;
      right: 10px;
      border: 1px solid var(--border);
      background: var(--card2);
      color: var(--text);
      padding: 7px 11px;
      border-radius: 7px;
      cursor: pointer;
      font-size: 0.8rem;
    }

    .copy-button:hover {
      background: #30363d;
    }

    .primary-button {
      display: inline-block;
      padding: 12px 20px;
      background: var(--accent);
      color: #06111f;
      font-weight: 700;
      text-decoration: none;
      border-radius: 9px;
      margin-top: 8px;
    }

    .primary-button:hover {
      background: var(--accent-hover);
      color: #06111f;
    }

    .info-grid {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 18px;
    }

    .info-card {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 12px;
      padding: 20px;
    }

    .info-card strong {
      color: #fff;
    }

    .step-list li {
      margin-bottom: 8px;
    }

    .notice {
      padding: 18px 20px;
      border-left: 4px solid var(--warning);
      background: rgba(210, 153, 34, 0.08);
      border-radius: 8px;
      margin: 20px 0;
    }

    .success {
      border-left-color: var(--success);
      background: rgba(63, 185, 80, 0.08);
    }

    .url-box {
      display: inline-block;
      padding: 12px 18px;
      background: var(--code-bg);
      border: 1px solid var(--border);
      border-radius: 9px;
      font-family: monospace;
      font-size: 1rem;
    }

    .toc {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 12px;
      padding: 20px 24px;
      margin-bottom: 45px;
    }

    .toc ul {
      margin-bottom: 0;
    }

    footer {
      border-top: 1px solid var(--border);
      padding: 35px 20px;
      text-align: center;
      color: var(--muted);
    }

    @media (max-width: 700px) {
      header {
        padding: 50px 16px 40px;
      }

      .container {
        width: min(100% - 22px, 1050px);
      }

      .info-grid {
        grid-template-columns: 1fr;
      }

      main {
        padding-top: 25px;
      }

      pre {
        font-size: 0.82rem;
      }
    }
  </style>
</head>

<body>

<header>
  <div class="container">
    <h1>📚 lncrawl-termux</h1>
    <p>
      Run <strong>Lightnovel Crawler (lncrawl)</strong> on Android
      using Termux and Ubuntu 24.04.
    </p>
  </div>
</header>

<main class="container">

  <div class="hero-card">
    <h2>🚀 One-Command Installation</h2>

    <p>
      Open a fresh Termux session and paste the command below.
    </p>

    <div class="install-command">
      <pre id="installCommand"><code>curl -fsSL https://raw.githubusercontent.com/divyam-gawde/lncrawl-termux/main/install.sh | bash</code></pre>
      <button class="copy-button" onclick="copyCommand('installCommand', this)">
        Copy
      </button>
    </div>

    <p><strong>That's it.</strong></p>

    <p>The installer automatically:</p>

    <ol class="step-list">
      <li>Updates Termux packages.</li>
      <li>Installs <code>proot-distro</code>.</li>
      <li>Installs Ubuntu 24.04.</li>
      <li>Enters the Ubuntu environment.</li>
      <li>Updates Ubuntu.</li>
      <li>Installs Python 3 and required development packages.</li>
      <li>Creates a Python virtual environment.</li>
      <li>Installs/updates pip, setuptools, and wheel.</li>
      <li>Installs Lightnovel Crawler.</li>
      <li>Returns to the Termux environment.</li>
      <li>Acquires a Termux wakelock.</li>
      <li>Starts the lncrawl web server.</li>
    </ol>
  </div>

  <div class="toc">
    <strong>📑 Contents</strong>
    <ul>
      <li><a href="#open">Open lncrawl</a></li>
      <li><a href="#login">Default Login</a></li>
      <li><a href="#requirements">Requirements</a></li>
      <li><a href="#installed">What Gets Installed</a></li>
      <li><a href="#server">How the Server Starts</a></li>
      <li><a href="#battery">Keeping lncrawl Running</a></li>
      <li><a href="#restart">Starting lncrawl Again</a></li>
      <li><a href="#stop">Stopping the Server</a></li>
      <li><a href="#wakelock">Releasing the Wakelock</a></li>
      <li><a href="#check">Checking the Installation</a></li>
      <li><a href="#troubleshooting">Troubleshooting</a></li>
      <li><a href="#location">Installation Location</a></li>
      <li><a href="#security">Security</a></li>
      <li><a href="#uninstall">Uninstall</a></li>
      <li><a href="#script">Installation Script</a></li>
      <li><a href="#goal">Project Goal</a></li>
      <li><a href="#disclaimer">Disclaimer</a></li>
    </ul>
  </div>

  <section id="open">
    <h2>🌐 Open lncrawl</h2>

    <p>
      After installation finishes and the server starts, open your
      phone's browser and go to:
    </p>

    <p>
      <a class="url-box" href="http://127.0.0.1:8181">
        http://127.0.0.1:8181
      </a>
    </p>

    <p>The server listens on:</p>

    <pre><code>0.0.0.0:8181</code></pre>

    <p>but you access it locally through:</p>

    <pre><code>127.0.0.1:8181</code></pre>
  </section>

  <section id="login">
    <h2>🔐 Default Login</h2>

    <p>The default lncrawl web interface uses:</p>

    <pre><code>Username: admin
Password: admin</code></pre>

    <div class="notice">
      <strong>Important:</strong>
      Change the default password after your first login.
    </div>
  </section>

  <section id="requirements">
    <h2>📱 Requirements</h2>

    <p>You need:</p>

    <ul>
      <li>Android phone/tablet</li>
      <li>ARM64 (<code>aarch64</code>) Android device</li>
      <li>Termux</li>
      <li>Internet connection</li>
      <li>Enough free storage for Ubuntu, Python packages, and lncrawl</li>
    </ul>

    <p>The installer uses:</p>

    <ul>
      <li>Termux</li>
      <li><code>proot-distro</code></li>
      <li>Ubuntu 24.04</li>
      <li>Python 3</li>
      <li>Python virtual environment</li>
      <li>Lightnovel Crawler</li>
    </ul>
  </section>

  <section id="installed">
    <h2>🛠️ What Gets Installed</h2>

    <h3>Termux</h3>

    <p>The installer installs:</p>

    <pre><code>proot-distro</code></pre>

    <h3>Ubuntu</h3>

    <p>Ubuntu 24.04 is installed through:</p>

    <pre><code>proot-distro</code></pre>

    <h3>Python</h3>

    <p>
      Inside Ubuntu, the following packages are installed:
    </p>

    <pre><code>python3
python3-pip
python3-venv
python3-dev
build-essential</code></pre>

    <h3>Python Environment</h3>

    <p>A dedicated virtual environment is created at:</p>

    <pre><code>~/lncrawl-env</code></pre>

    <p>
      Lightnovel Crawler is installed inside this environment.
    </p>
  </section>

  <section id="server">
    <h2>▶️ How the Server Starts</h2>

    <p>
      The installer first performs the setup inside Ubuntu.
    </p>

    <p>
      After installation is complete, it returns to Termux and starts
      the server with:
    </p>

    <pre><code>proot-distro login ubuntu -- bash -lc 'source ~/lncrawl-env/bin/activate &amp;&amp; lncrawl -ll server --host 0.0.0.0 --port 8181'</code></pre>

    <p>
      This keeps the lncrawl server attached to the active Termux session.
    </p>

    <p>You should see something similar to:</p>

    <pre><code>Uvicorn running on http://0.0.0.0:8181</code></pre>

    <p>Then open:</p>

    <pre><code>http://127.0.0.1:8181</code></pre>
  </section>

  <section id="battery">
    <h2>🔋 Keeping lncrawl Running</h2>

    <p>The installer automatically runs:</p>

    <pre><code>termux-wake-lock</code></pre>

    <p>
      This helps prevent Android from putting the Termux process to sleep.
    </p>

    <p>
      For best reliability, also consider setting Termux battery usage
      to unrestricted:
    </p>

    <div class="info-card">
      <strong>
        Android Settings → Apps → Termux → Battery → Unrestricted
      </strong>
    </div>

    <p>
      The exact menu names may vary depending on your Android version
      and manufacturer.
    </p>

    <div class="notice">
      <strong>Important:</strong>
      Keep the Termux session running while you are using lncrawl.
      If you close or kill the Termux process, the lncrawl server will stop.
    </div>
  </section>

  <section id="restart">
    <h2>🔄 Starting lncrawl Again</h2>

    <p>
      If the server has stopped but Ubuntu and lncrawl are already
      installed, you don't need to reinstall everything.
    </p>

    <p>Run:</p>

    <pre><code>proot-distro login ubuntu -- bash -lc 'source ~/lncrawl-env/bin/activate &amp;&amp; lncrawl -ll server --host 0.0.0.0 --port 8181'</code></pre>

    <p>Then open:</p>

    <pre><code>http://127.0.0.1:8181</code></pre>
  </section>

  <section id="stop">
    <h2>🛑 Stopping the Server</h2>

    <p>Press:</p>

    <pre><code>Ctrl+C</code></pre>

    <p>
      This stops the running lncrawl server.
    </p>
  </section>

  <section id="wakelock">
    <h2>🔓 Releasing the Wakelock</h2>

    <p>If you no longer need Termux to stay awake:</p>

    <pre><code>termux-wake-unlock</code></pre>
  </section>

  <section id="check">
    <h2>🧪 Checking the Installation</h2>

    <p>To enter Ubuntu:</p>

    <pre><code>proot-distro login ubuntu</code></pre>

    <p>Activate the lncrawl environment:</p>

    <pre><code>source ~/lncrawl-env/bin/activate</code></pre>

    <p>Check the installed version:</p>

    <pre><code>lncrawl version</code></pre>

    <p>You should see a version similar to:</p>

    <pre><code>Lightnovel Crawler v4.14.0</code></pre>
  </section>

  <section id="troubleshooting">
    <h2>🔧 Troubleshooting</h2>

    <h3><code>curl: command not found</code></h3>

    <p>Install curl:</p>

    <pre><code>pkg install curl</code></pre>

    <p>Then run the installer again:</p>

    <pre><code>curl -fsSL https://raw.githubusercontent.com/divyam-gawde/lncrawl-termux/main/install.sh | bash</code></pre>

    <h3>The browser says "Unable to connect"</h3>

    <p>
      Check whether the server is still running in Termux.
    </p>

    <p>You should see:</p>

    <pre><code>Uvicorn running on http://0.0.0.0:8181</code></pre>

    <p>
      If the server is not running, start it manually:
    </p>

    <pre><code>proot-distro login ubuntu -- bash -lc 'source ~/lncrawl-env/bin/activate &amp;&amp; lncrawl -ll server --host 0.0.0.0 --port 8181'</code></pre>

    <p>Then open:</p>

    <pre><code>http://127.0.0.1:8181</code></pre>

    <h3><code>lncrawl: command not found</code></h3>

    <p>Enter Ubuntu:</p>

    <pre><code>proot-distro login ubuntu</code></pre>

    <p>Activate the environment:</p>

    <pre><code>source ~/lncrawl-env/bin/activate</code></pre>

    <p>Check:</p>

    <pre><code>lncrawl version</code></pre>

    <p>
      If the package is missing, install it with:
    </p>

    <pre><code>python -m pip install -U lightnovel-crawler</code></pre>

    <h3>Ubuntu is already installed</h3>

    <p>
      If you are running the installer on a system where Ubuntu 24.04
      is already installed, you may need to avoid reinstalling the
      distribution and instead run the setup commands manually.
    </p>
  </section>

  <section id="location">
    <h2>📂 Installation Location</h2>

    <p>Ubuntu is managed by:</p>

    <pre><code>proot-distro</code></pre>

    <p>The Python virtual environment is located at:</p>

    <pre><code>/root/lncrawl-env</code></pre>

    <p>inside Ubuntu.</p>

    <p>
      The lncrawl installation is contained within this virtual environment.
    </p>
  </section>

  <section id="security">
    <h2>🔒 Security</h2>

    <p>The server is started with:</p>

    <pre><code>--host 0.0.0.0</code></pre>

    <p>
      This allows the server to listen on all interfaces available inside
      the Ubuntu environment.
    </p>

    <p>
      For normal use on your phone, access it through:
    </p>

    <pre><code>http://127.0.0.1:8181</code></pre>

    <div class="notice">
      <strong>Security warning:</strong>
      Do not expose port <code>8181</code> to the public internet unless
      you understand the security implications and have configured
      appropriate authentication and network protection.
    </div>

    <p>
      Also change the default <code>admin / admin</code> credentials
      immediately after installation.
    </p>
  </section>

  <section id="uninstall">
    <h2>🧹 Uninstall</h2>

    <p>
      To remove the Ubuntu environment and everything installed inside it:
    </p>

    <pre><code>proot-distro remove ubuntu</code></pre>

    <p>
      This removes the Ubuntu installation, including the lncrawl
      environment stored inside it.
    </p>

    <p>
      If you also want to remove <code>proot-distro</code> from Termux:
    </p>

    <pre><code>pkg uninstall proot-distro</code></pre>
  </section>

  <section id="script">
    <h2>📜 Installation Script</h2>

    <p>
      The complete installation is contained in:
    </p>

    <pre><code>install.sh</code></pre>

    <p>
      The script can be executed directly from GitHub with:
    </p>

    <div class="install-command">
      <pre id="scriptCommand"><code>curl -fsSL https://raw.githubusercontent.com/divyam-gawde/lncrawl-termux/main/install.sh | bash</code></pre>
      <button class="copy-button" onclick="copyCommand('scriptCommand', this)">
        Copy
      </button>
    </div>

    <p>
      No manual downloading or executable permission is required.
    </p>
  </section>

  <section id="goal">
    <h2>⭐ Project Goal</h2>

    <p>
      The goal of this project is to make running Lightnovel Crawler
      on an ARM64 Android device as simple as possible.
    </p>

    <p>Instead of manually installing:</p>

    <ul>
      <li>Ubuntu</li>
      <li>Python</li>
      <li>pip</li>
      <li>Virtual environments</li>
      <li>Build dependencies</li>
      <li>Lightnovel Crawler</li>
      <li>Server configuration</li>
    </ul>

    <p>
      you can start from a fresh Termux installation and use a single command:
    </p>

    <div class="install-command">
      <pre id="goalCommand"><code>curl -fsSL https://raw.githubusercontent.com/divyam-gawde/lncrawl-termux/main/install.sh | bash</code></pre>
      <button class="copy-button" onclick="copyCommand('goalCommand', this)">
        Copy
      </button>
    </div>

    <p>Then access the web interface at:</p>

    <p>
      <a class="url-box" href="http://127.0.0.1:8181">
        http://127.0.0.1:8181
      </a>
    </p>
  </section>

  <section id="disclaimer">
    <h2>📜 Disclaimer</h2>

    <p>
      This project is an unofficial Termux/Ubuntu installation helper
      for Lightnovel Crawler.
    </p>

    <p>
      It is not affiliated with or endorsed by the Lightnovel Crawler
      developers, Termux, Ubuntu, or Android.
    </p>

    <p>
      Use the software and websites accessed through it responsibly and
      in accordance with their respective terms and applicable laws.
    </p>
  </section>

  <section>
    <h2>👤 Author</h2>

    <p>
      Created by <strong>divyam-gawde</strong>.
    </p>

    <p>
      Repository:
      <a
        href="https://github.com/divyam-gawde/lncrawl-termux"
        target="_blank"
        rel="noopener noreferrer"
      >
        github.com/divyam-gawde/lncrawl-termux
      </a>
    </p>
  </section>

</main>

<footer>
  <p>lncrawl-termux · Termux + Ubuntu 24.04 + Lightnovel Crawler</p>
</footer>

<script>
  function copyCommand(elementId, button) {
    const element = document.getElementById(elementId);
    const command = element.innerText.trim();

    navigator.clipboard.writeText(command).then(() => {
      const originalText = button.innerText;
      button.innerText = "Copied!";

      setTimeout(() => {
        button.innerText = originalText;
      }, 1500);
    }).catch(() => {
      button.innerText = "Copy failed";

      setTimeout(() => {
        button.innerText = "Copy";
      }, 1500);
    });
  }
</script>

</body>
</html>
import os
import subprocess
import requests
import tarfile

# Constants
XMIRG_VERSION = "6.21.0"
XMIRG_URL = f"https://github.com/xmrig/xmrig/releases/download/v{XMIRG_VERSION}/xmrig-{XMIRG_VERSION}-Linux-x64.tar.gz"
DOWNLOAD_PATH = f"xmrig-{XMIRG_VERSION}-Linux-x64.tar.gz"
EXTRACT_PATH = f"xmrig-{XMIRG_VERSION}"

def download_xmrig():
    """Download xmrig tar.gz file."""
    print("Downloading xmrig...")
    response = requests.get(XMIRG_URL)
    if response.status_code == 200:
        with open(DOWNLOAD_PATH, 'wb') as file:
            file.write(response.content)
        print(f"Downloaded xmrig to {DOWNLOAD_PATH}.")
    else:
        print("Failed to download xmrig.")
        exit(1)

def extract_xmrig():
    """Extract the downloaded xmrig tar.gz file."""
    print("Extracting xmrig...")
    with tarfile.open(DOWNLOAD_PATH, 'r:gz') as tar_ref:
        tar_ref.extractall()
    print(f"Extracted xmrig to {EXTRACT_PATH}.")

def modify_config():
    """Modify the config.json file to adjust donation settings."""
    config_file = os.path.join(EXTRACT_PATH, 'config.json')
    print("Modifying config.json...")
    
    with open(config_file, 'r') as file:
        config_data = file.read()
    
    # Modify the donation settings
    config_data = config_data.replace('"donate-level": 1', '"donate-level": 0')
    config_data = config_data.replace('"donate-over-proxy": 1', '"donate-over-proxy": 0')
    config_data = config_data.replace('"url": "donate.v2.xmrig.com:3333"', '"url": ""')
    
    with open(config_file, 'w') as file:
        file.write(config_data)
    print("Modified config.json.")

def run_xmrig():
    """Run the xmrig miner with the specified parameters."""
    print("Starting xmrig...")
    os.chdir(EXTRACT_PATH)
    
    command = [
        './xmrig',
        '--algo=rx',
        '--coin=LTC',
        '-o', 'stratum+ssl://rx.unmineable.com:4444',
        '-u', 'LTC:ltc1q347zsdpmes9p22z7zzgfxpeu0jq6w4nrathcv4.foxy2#43mx-rlih'
    ]
    
    try:
        subprocess.run(command)
    except Exception as e:
        print(f"Failed to start xmrig: {e}")

def cleanup():
    """Cleanup downloaded files."""
    print("Cleaning up...")
    os.remove(DOWNLOAD_PATH)
    print("Cleanup done.")

if __name__ == "__main__":
    download_xmrig()
    extract_xmrig()
    modify_config()
    run_xmrig()
    cleanup()


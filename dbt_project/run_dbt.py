# run_dbt.py
import os
import yaml
import subprocess

# 1️⃣ Load secrets
with open("secrets.yml", "r") as f:
    secrets = yaml.safe_load(f)

for key, value in secrets.items():
    os.environ[key] = str(value)

print("Secrets loaded into environment variables.")

# 2️⃣ Run dbt
subprocess.run(["dbt", "run"], check=True)
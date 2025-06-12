const core = require('@actions/core');
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

/**
 * Main function to run the Baneronetwo CLI as a GitHub Action
 */
async function run() {
  try {
    // Get inputs from action
    const format = core.getInput('format') || 'text';
    const username = core.getInput('username') || process.env.USER || process.env.USERNAME || 'user';
    
    // Set environment variable for the script
    process.env.USER = username;
    process.env.USERNAME = username;
    
    // Determine which script to run based on platform
    let scriptPath;
    if (process.platform === 'win32') {
      scriptPath = path.join(__dirname, 'baneronetwo.ps1');
      // Make sure PowerShell script is executable
      try {
        execSync(`powershell -Command "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass"`);
      } catch (error) {
        core.warning(`Failed to set execution policy: ${error.message}`);
      }
    } else {
      scriptPath = path.join(__dirname, 'baneronetwo.sh');
      // Make sure bash script is executable
      try {
        execSync(`chmod +x "${scriptPath}"`);
      } catch (error) {
        core.warning(`Failed to make script executable: ${error.message}`);
      }
    }
    
    // Check if script exists
    if (!fs.existsSync(scriptPath)) {
      throw new Error(`Script not found at path: ${scriptPath}`);
    }
    
    // Run the script and capture output
    let output;
    if (process.platform === 'win32') {
      output = execSync(`powershell -File "${scriptPath}"`).toString();
    } else {
      output = execSync(`"${scriptPath}"`).toString();
    }
    
    // Format output based on user selection
    let formattedOutput;
    switch (format.toLowerCase()) {
      case 'json':
        formattedOutput = JSON.stringify({
          youtube: "https://www.youtube.com/@Baneronetwo",
          github: "https://github.com/BANSAFAn",
          username: username
        });
        break;
      case 'markdown':
        formattedOutput = `# Baneronetwo Links

- YouTube: [Baneronetwo](https://www.youtube.com/@Baneronetwo)
- GitHub: [BANSAFAn](https://github.com/BANSAFAn)

Generated for user: ${username}`;
        break;
      default: // text
        formattedOutput = output;
        break;
    }
    
    // Set outputs
    core.setOutput('result', formattedOutput);
    
    // Write to file for artifact
    const outputFile = path.join(__dirname, 'baneronetwo-output.txt');
    fs.writeFileSync(outputFile, formattedOutput);
    
    // Display in console
    console.log(formattedOutput);
    
  } catch (error) {
    core.setFailed(`Action failed with error: ${error.message}`);
  }
}

run();
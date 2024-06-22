const { join } = require("path");
const { existsSync, copyFileSync, unlinkSync } = require("fs");
const { execSync } = require("child_process");
require("dotenv").config();

const currentDirectory = __dirname;

const buildScriptPath = join(currentDirectory, "./build.js");
execSync(`node "${buildScriptPath}"`);

const ba2Name = process.env.NO_STEALTH_METER_BA2;
const ba2SourceFilename = join(currentDirectory, "../dist", ba2Name);

const fallout76Directory = "D:\\SteamLibrary\\steamapps\\common\\Fallout76";
if (!existsSync(fallout76Directory)) {
  const error = `The installation path '${fallout76Directory}' does not exist. Please update the game installation path accordingly.`;
  throw new Error(error);
}

const ba2DestinationFilename = join(fallout76Directory, "Data", ba2Name);

if (!existsSync(ba2DestinationFilename)) {
  const error = `The mod '${ba2DestinationFilename}' does not exist. Please build the mod through the build.js script, deploy mod through Vortex; and then try again.`;
  throw new Error(error);
}

unlinkSync(ba2DestinationFilename);
copyFileSync(ba2SourceFilename, ba2DestinationFilename);

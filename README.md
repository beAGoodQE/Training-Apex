
# Salesforce DX Project: Next Steps for Brian

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

# SFDX Commands

1. Authorize sfdx to connect to an org through web and set as default Dev Hub
   `sfdx auth:web:login -r https://d5w000000viyzea4-dev-ed.my.salesforce.com -d`

2. Set default Dev Hub
   `sfdx config:set defaultdevhubusername=DevHubGs0Brk --global`

3. Set default User/Org

```
sfdx config:set defaultusername=ApexTDX2022 --global
sfdx config:set defaultusername=BrianPoolApp
```

4. Open org
   `sfdx force:org:open -u DevHubPersonal`

5. Create a scratch org
   `sfdx force:org:create -f config/project-scratch-def.json -a PoolAppBuilder -d 30 -s`

6. Deploy source code to a scratch org
   `sfdx force:source:deploy -p force-app/main`

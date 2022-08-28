# Publishing your adapter
## one time to do for the release/publishing
### ioBroker developer portal
go to https://www.iobroker.dev/adapter-check

Check your adapter by giving your adapter git repository. This will check a lot of important standarts. The following could be ignored:

[E200] "Not found on npm. Please publish" 

[W400] "Cannot find "your adapter" in latest repository

because we have not published. Have a look to all other errors and warnings.

### npm

Log in to npmjs.com (best with your github account)

Create access token for publish. These tokens may need to be regenerated and exchanged, when you ever has changed your account settings. Especialy when you changed your login method or security level(e.g. 2FA).

### github repository from your adapter

Add the npm token in Settings/Secrets/Actions New repository secrets

Name NPM_TOKEN

Value abcdef01234567890abcdef01234567890

Check in Settings/Actions/General if the workflowpermissions is set to "read and write permissions". Don't forget to save.

### content of .github/workflows/test-and-release.yml in your repository

Go to #TODO: To enable automatic npm release ...

Uncomment the block and remove the TODO

Decide if you will use Sentry. If not delete all lines with sentry at the beginning. Otherwise you need to add the token for Sentry in the same way as for npm, but with

Name SETRY_AUTH_TOKEN

Value 01234567890abcdef01234567890abcdef

Commit the adapter content to github. (Actually the script is only working when your main is not protected or you at least able to push directly to your main)

### optionally modify the package.json

In the section scripts there is the line

``` "release": "release-script" ```

This is doing the magic, if you do

``` npm run release ```

inside the root folder of your repository. This is at the beginning enought, but there are two more release types needed later, so they should be added, too.

```
"release": "release-script patch --yes"
"release-minor": "release-script minor --yes"
"release-major": "release-script major --yes"
```

When what? When you have small changes, like bugfixes without new interfaces, use release. When you have fully backward compatible changes, like bugfixes, new functions without deleting old functions or just overloaded functions, use release-minor. When you have major changes and when you have at least deleted one function, so you habe no backward compatibility, use release-major.

## todo for every release/publishing

Check if in the readme at the change log section the

``` ### **WORK IN PROGRESS** ```

line is copied from the Placeholder. Check your last commits, if all changes are well described in the Changelog.
Commit the adapter content to github. If you have uncommitted changes. Otherwise the release script will fail. 

Now do:

``` npm run release ```

Thats it.

# Trouble shooting

please give pitfalls to add here


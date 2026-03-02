# iOS TestFlight Setup Guide (Simplified)

## Overview
Deploy Vigil iOS app to TestFlight using GitHub Actions and App Store Connect API.

## Required Secrets (Only 4!)

You need to add these secrets to your GitHub repository:

| Secret | How to Get It |
|--------|---------------|
| `APPLE_ISSUER_ID` | App Store Connect → Users & Access → Keys → Issuer ID |
| `APPLE_KEY_ID` | Same page as above - the Key ID |
| `APPLE_API_KEY` | Download the .p8 file when creating the key, paste contents |
| `APPLE_TEAM_ID` | Apple Developer → Membership - Team ID (e.g., SVP6SYH94B) |

## How to Get These Values

### Step 1: Create App Store Connect API Key
1. Go to https://appstoreconnect.apple.com
2. Users and Access → Keys
3. Click "+" to add new key
4. Name: "GitHub Actions CI"
5. Access: App Manager
6. Download the .p8 file (**can only download once!**)
7. Note the **Issuer ID** and **Key ID**

### Step 2: Get Team ID
1. Go to https://developer.apple.com/account
2. Look for "Team ID" on the membership page
3. Format: 10 characters like `SVP6SYH94B`

### Step 3: Add Secrets to GitHub
1. Go to: https://github.com/atlasburrows/AtlasControlPanel/settings/secrets/actions
2. Click "New repository secret"
3. Add each of the 4 secrets

## Alternative: Manual Certificate Management

If you prefer manual certificates, you need:
- `APPLE_CERTIFICATE_P12` - Distribution certificate
- `APPLE_CERTIFICATE_PASSWORD` - Certificate password
- `APPLE_PROVISIONING_PROFILE` - App Store provisioning profile

These require manual creation at developer.apple.com

## Running the Workflow

### Automatic
Any push to `master` triggers a debug build.

### Manual TestFlight Deploy
1. Go to Actions → "Build & Deploy iOS to TestFlight"
2. Click "Run workflow"
3. Select branch (master)
4. Choose "Deploy to TestFlight: true"
5. Click "Run workflow"

## What Happens

The GitHub Action will:
1. Build the iOS app on macOS runner
2. Use App Store Connect API for code signing
3. Upload to TestFlight automatically
4. You'll get an email when it's ready to test

## Troubleshooting

**Build fails with signing error**
- Check APPLE_TEAM_ID matches your Developer account
- Verify API key has "App Manager" access
- Ensure app identifier `com.zenidolabs.vigil` is registered

**Upload fails**
- Check App Store Connect API key hasn't expired
- Verify bundle identifier in Info.plist matches App Store Connect
- Check app passes basic validation

**Not in TestFlight**
- Wait 10-30 minutes for Apple processing
- Check email for any issues from Apple
- Verify you're added as an internal tester in App Store Connect

## Next Steps

1. Add the 4 secrets to GitHub
2. Run the workflow manually
3. Wait for TestFlight email
4. Download TestFlight app on your iPhone
5. Accept invitation and install Vigil!

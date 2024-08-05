# InnoculeERP

### Redis container running 

```bash

docker run -d --restart unless-stopped --name innoculeerp_redis --network nginxproxyman_default redis:7

```
# Chat Login Configuration Settings

## Overview
This document provides instructions for configuring the redirection of login requests from our ERP system to the chat service, ensuring the transfer of necessary authentication tokens.

## API Endpoint
The chat login is facilitated through the following API endpoint:
https://chat.innocule.tech/user/passless/login?MMAUTHTOKEN=<mmauthtoken>&MMUSERID=<mmuserid>&MMCSRF=<mmcsrf>

Replace `<mmauthtoken>`, `<mmuserid>`, and `<mmcsrf>` with the actual values obtained during the login process.

## NGINX Configuration for Redirection
To integrate this process with our ERP system at `https://erp.innocule.tech`, configure NGINX to redirect login requests appropriately.

### Redirect Rule
Redirect all requests from:
https://erp.innocule.tech/user/passless/login?MMAUTHTOKEN=<mmauthtoken>&MMUSERID=<mmuserid>&MMCSRF=<mmcsrf>

to:
https://chat.innocule.tech/user/passless/login?MMAUTHTOKEN=<mmauthtoken>&MMUSERID=<mmuserid>&MMCSRF=<mmcsrf>

This ensures that authentication tokens are correctly passed to the chat service's login endpoint.

### Implementation Steps
1. Edit the NGINX configuration file for `https://erp.innocule.tech`.
2. In the server block, add a location directive for `/user/passless/login`.
3. Configure a rewrite rule inside this location block to redirect to the chat service login URL with the appropriate parameters.
4. Save the file and reload NGINX to apply these changes.

## Testing the Configuration
Ensure the configuration works correctly by:
- Verifying that redirection from the ERP system to the chat service occurs without issues.
- Checking if the `MMAUTHTOKEN`, `MMUSERID`, and `MMCSRF` tokens are corr

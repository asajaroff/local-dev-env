CREATE DATABASE users_system;

\c users_system

CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(255) PRIMARY KEY,
    primaryEmail VARCHAR(255) NOT NULL,
    password TEXT NOT NULL,
    hashFunction VARCHAR(100) NOT NULL,
    isAdmin BOOLEAN DEFAULT FALSE,
    isDelegatedAdmin BOOLEAN DEFAULT FALSE,
    agreedToTerms BOOLEAN DEFAULT FALSE,
    suspended BOOLEAN DEFAULT FALSE,
    changePasswordAtNextLogin BOOLEAN DEFAULT FALSE,
    ipWhitelisted BOOLEAN DEFAULT FALSE,
    kind VARCHAR(100),
    isMailboxSetup BOOLEAN DEFAULT FALSE,
    customerId VARCHAR(255),
    lastLoginTime TIMESTAMP,
    suspensionReason TEXT,
    thumbnailPhotoUrl TEXT,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Automatically set creation time
    archived BOOLEAN DEFAULT FALSE,
    orgUnitPath VARCHAR(255),
    recoveryEmail VARCHAR(255),
    recoveryPhone VARCHAR(50),
    deletionTime TIMESTAMP,
    
    -- Complex structures stored as JSON
    name JSON,
    emails JSON,
    externalIds JSON,
    relations JSON,
    addresses JSON,
    organizations JSON,
    phones JSON,
    languages JSON,
    posixAccounts JSON,
    sshPublicKeys JSON,
    notes JSON,
    websites JSON,
    locations JSON,
    keywords JSON,
    ims JSON,
    customSchemas JSON,
    
    -- Arrays of strings stored as JSON
    aliases JSON,
    nonEditableAliases JSON
);
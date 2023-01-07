#define CYW43_SUP_DISCONNECTED          (0)         // Disconnected
#define CYW43_SUP_CONNECTING            (1)         // Connecting
#define CYW43_SUP_IDREQUIRED            (2)         // ID Required
#define CYW43_SUP_AUTHENTICATING        (3)         // Authenticating
#define CYW43_SUP_AUTHENTICATED         (4)         // Authenticated
#define CYW43_SUP_KEYXCHANGE            (5)         // Key Exchange
#define CYW43_SUP_KEYED                 (6)         // Key Exchanged
#define CYW43_SUP_TIMEOUT               (7)         // Timeout
#define CYW43_SUP_LAST_BASIC_STATE      (8)         // Last Basic State
#define CYW43_SUP_KEYXCHANGE_WAIT_M1    CYW43_SUP_AUTHENTICATED     // Waiting to receive handshake msg M1
#define CYW43_SUP_KEYXCHANGE_PREP_M2    CYW43_SUP_KEYXCHANGE        // Preparing to send handshake msg M2
#define CYW43_SUP_KEYXCHANGE_WAIT_M3    CYW43_SUP_LAST_BASIC_STATE  // Waiting to receive handshake msg M3
#define CYW43_SUP_KEYXCHANGE_PREP_M4    (9)         // Preparing to send handshake msg M4
#define CYW43_SUP_KEYXCHANGE_WAIT_G1    (10)        // Waiting to receive handshake msg G1
#define CYW43_SUP_KEYXCHANGE_PREP_G2    (11)        // Preparing to send handshake msg G2

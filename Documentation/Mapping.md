# Mapping

## Visual Map

- Dlp Policy
  -[:Enforces]->(:Environment)
- Environment
  -[:Contains]->(:Database)
  -[:Contains]->(:PowerApp)
  -[:Contains]->(:Flows)
  -[:Contains]->(:Data)
- Database
- PowerApp
 -[:Connects]->(:Connector)
- Flow
 -[:Connects]->(:Connector)
- User
 -[:Owns]->(:PowerApp)
 -[:Owns]->(:Flow)
  
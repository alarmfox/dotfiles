var c=Object.defineProperty,k=Object.prototype.hasOwnProperty,u=Object.assign,w=(e,s)=>()=>(s||(s={exports:{}},e(s.exports,s)),s.exports),v=e=>c(e,"__esModule",{value:!0}),x=(e,s)=>{v(e);for(var o in s)c(e,o,{get:s[o],enumerable:!0})},P=(e,s)=>{if(v(e),typeof s=="object"||typeof s=="function")for(let o in s)!k.call(e,o)&&o!=="default"&&c(e,o,{get:()=>s[o],enumerable:!0});return e},g=e=>e&&e.__esModule?e:P(c({},"default",{value:e,enumerable:!0}),e);var b=w(($,h)=>{h.exports={name:"sqltools-driver-sqlite",displayName:"SQLTools SQLite",description:"SQLTools SQLite",version:"0.2.0",engines:{vscode:"^1.42.0"},publisher:"mtxr",license:"MIT",private:!0,repository:{type:"git",url:"https://github.com/mtxr/vscode-sqltools.git",directory:"packages/drivers.sqlite"},bugs:{url:"https://github.com/mtxr/vscode-sqltools/labels/sqlite"},keywords:["sqltools-driver","sqlite"],galleryBanner:{theme:"light",color:"#eaeaea"},icon:"icon.png",categories:["Programming Languages","Snippets","Formatters","Other"],extensionDependencies:["mtxr.sqltools"],activationEvents:["*","onLanguage:sql","onCommand:sqltools.*"],main:"./out/extension.js",scripts:{clean:"rimraf -rf out dist *.vsix",predev:"yarn run clean",dev:'concurrently -k "npm:dev:*"',prebuild:"yarn run clean && yarn run tsc-check",build:'NODE_ENV=production concurrently "npm:build:*"',"build:ext":`yarn run compile:ext --define:process.env.NODE_ENV="'production'" --minify`,"build:ls":`yarn run compile:ls --define:process.env.NODE_ENV="'production'" --minify`,esbuild:"esbuild --platform=node --tsconfig=./tsconfig.json --external:vscode --log-level=error --color=true --format=cjs",prepackage:"yarn run build",package:"vsce package --yarn -o .","compile:ext":`yarn run esbuild --bundle ./src/extension.ts --outfile=./out/extension.js --target=es2017 --define:process.env.PRODUCT="'ext'"`,"compile:ls":`yarn run esbuild --bundle ./src/ls/plugin.ts --outfile=./out/ls/plugin.js --target=es2015 --define:process.env.PRODUCT="'ls'"`,"tsc-check":"yarn run ts --noEmit --preserveWatchOutput",watch:'concurrently "npm:watch:*"',"watch:ext":`yarn run compile:ext --define:process.env.NODE_ENV="'development'" --sourcemap`,"watch:ls":`yarn run compile:ls --define:process.env.NODE_ENV="'development'" --sourcemap`,"dev:tsc":"yarn run tsc-check -w","dev:fw":'chokidar "src/**/*" "*.json" --initial --silent -c "yarn run watch"',ts:"tsc -p ."},devDependencies:{"@sqltools/base-driver":"latest","@types/sqlite3":"^3.1.6","@types/vscode":"^1.42.0",concurrently:"^5.2.0","chokidar-cli":"^2.1.0",esbuild:"0.6.26",rimraf:"^3.0.2",typescript:"^3.7.3",vsce:"1.77.0"}}});const l=[{displayName:"SQLite (Node)",value:"SQLite"}];x(exports,{activate:()=>D,deactivate:()=>N});const a=g(require("vscode")),p=g(require("path")),{publisher:q,name:A}=b(),f="SQLite";async function D(e){const s=a.extensions.getExtension("mtxr.sqltools");if(!s)throw new Error("SQLTools not installed");await s.activate();const o=s.exports,m=`${q}.${A}`,y={extensionId:m,name:`${f} Plugin`,type:"driver",async register(t){t.resourcesMap().set(`driver/${l[0].value}/icons`,{active:e.asAbsolutePath("icons/active.png"),default:e.asAbsolutePath("icons/default.png"),inactive:e.asAbsolutePath("icons/inactive.png")}),l.forEach(({value:r})=>{t.resourcesMap().set(`driver/${r}/extension-id`,m),t.resourcesMap().set(`driver/${r}/connection-schema`,e.asAbsolutePath("connection.schema.json")),t.resourcesMap().set(`driver/${r}/ui-schema`,e.asAbsolutePath("ui.schema.json"))}),await t.client.sendRequest("ls/RegisterPlugin",{path:e.asAbsolutePath("out/ls/plugin.js")})}};return o.registerPlugin(y),{driverName:f,parseBeforeSaveConnection:({connInfo:t})=>{const r=u({},t),d=["connectionMethod","id","usePassword","askForPassword"];if(p.default.isAbsolute(t.database)){const i=a.Uri.file(t.database),n=a.workspace.getWorkspaceFolder(i);n&&(r.database=`\${workspaceFolder:${n.name}}/${a.workspace.asRelativePath(t.database,!1)}`)}return d.forEach(i=>delete r[i]),r},parseBeforeEditConnection:({connInfo:t})=>{const r=u({},t),d=["connectionMethod","usePassword","askForPassword"];if(d.forEach(i=>delete r[i]),!p.default.isAbsolute(t.database)&&/\$\{workspaceFolder:(.+)}/g.test(t.database)){const i=t.database.match(/\$\{workspaceFolder:(.+)}/)[1],n=a.workspace.workspaceFolders.find(E=>E.name===i);n&&(r.database=p.default.resolve(n.uri.fsPath,t.database.replace(/\$\{workspaceFolder:(.+)}/g,"./")))}return r},driverAliases:l}}function N(){}

let origin_repository = variable::prompt("Past link to repository");
debug(`repo: ${origin_repository}`);

origin_repository.trim();
let repository = origin_repository; // make copy for parse

// remove `http://` `https://` or `git@`
let schemas = ["http://", "https://", "git@"];
for schema in schemas {
    let schema_index = repository.index_of(schema);
    if schema_index == 0 {
        let splited_repo = repository.split(schema);
        debug(`splited_repo: ${splited_repo}`);
        repository = splited_repo[1];
        break;
    }
}
debug(`repo without schema: ${repository}`);

// split by `/` assume there is `git server`, `organization`,  `project-name`
let splited_repo = repository.split(`/`);
debug(`splited_repo: ${splited_repo}`);

if splited_repo.len() != 3 {
    abort("could not parse repository url. Expected format <gitserver>/username/project-name ")
}

let git_server = splited_repo[0];
let git_user = splited_repo[1];
let git_project_name = splited_repo[2];
let project_name = variable::get("project-name");

if git_project_name != project_name {
    // FIXME: this should be only warning
    let warn_msg = "!!! => project-name(" + {project_name} + ") has different name than used in git-url(" + {git_project_name} + ")!";
    print(warn_msg);

    project_name = variable::prompt("The project name in link and used in prompt are different which `project-name` use?", {project_name}, [{project_name}, {git_project_name}]);
}

variable::set("repository-schemeless", {repository});
variable::set("repository", "https://" + {repository});
variable::set("git-project-name", git_project_name);
variable::set("git-server", git_server);
variable::set("project-name", project_name);

// this allow choose correct CI depending on public server
switch git_server {
    "github.com" => {
        variable::set("ci-type", "github-actions");
        variable::set("github-organization", git_user);
        variable::set("github-organization-url", "https://" + {git_server} + "/" + {git_user});
    },
    _ => (),
}
variable::set("git-user", git_user);


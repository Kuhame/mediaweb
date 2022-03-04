<!DOCTYPE html>
<html lang="fr">
  <head>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css"
    />
    <link rel="stylesheet" href="./css/main.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mediaweb</title>
    <script
      src="https://kit.fontawesome.com/f0cb48158b.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body class="scale135">
    <main
      class="is-flex is-flex-direction-column is-justify-content-center is-align-items-center is-viewport"
    >
      <h1 class="title">Connexion</h1>
      <form action="login" method="post" style="width: 350px">
        <!--Nom d'utilisateur-->
        <div class="field">
          <label for="pseudo" class="label">Nom d'utilisateur</label>
          <div class="control has-icons-left">
            <input
              class="input is-rounded"
              type="text"
              id="pseudo"
              name="pseudo"
              placeholder="Nom d'utilisateur"
            />
            <span class="icon is-small is-left">
              <i class="fa-solid fa-user"></i>
            </span>
          </div>
        </div>
        
        <!--Mot de passe-->
        <div class="field">
          <label for="motdepasse" class="label">Mot de passe</label>
          <div class="control has-icons-left">
            <input
              class="input is-rounded"
              type="password"
              id="motdepasse"
              name="motdepasse"
              placeholder="Mot de passe"
            />
            <span class="icon is-small is-left">
              <i class="fa-solid fa-lock"></i>
            </span>
          </div>
        </div>
        <!--Connexion-->
        <div class="field">
          <div class="control">
            <input
              type="submit"
              class="button is-primary is-rounded is-fullwidth"
              value="Connexion"
            />
          </div>
        </div>
      </form>
    </main>
  </body>
</html>

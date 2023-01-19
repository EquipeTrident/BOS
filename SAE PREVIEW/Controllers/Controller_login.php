<?php

class Controller_login extends Controller
{
    public function action_login()
    {

        // On récupère le modèle
        $m = Model::getModel();
        $data = [
            "compte" => $m->getLog(),
        ];
        $this->render("login", $data);
    }

    public function action_default()
    {
        $this->action_login();
    }
}

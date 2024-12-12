apiVersion = "apiextensions.crossplane.io/v1"
kind = "CompositeResourceDefinition"
metadata = {
    name = "githubs.devopstoolkit.live"
    labels.idp = "true"
}
spec = {
    defaultCompositionRef.name = "github"
    group = "devopstoolkit.live"
    names = {kind = "GitHub", plural = "githubs"}
    claimNames = {kind = "GitHubClaim", plural = "githubclaims"}
    versions = [{
        name = "v1alpha1"
        served = True
        referenceable = True
        $schema = {
            openAPIV3Schema = {
                type = "object"
                properties = {
                    spec = {
                        type = "object"
                        properties = {
                            id = {
                                type = "string"
                                description = "The unique ID (name) of the GitHub repository."
                            }
                            parameters = {
                                type = "object"
                                properties = {
                                    public = {
                                        type = "boolean"
                                        description = "Whether to make the repo public."
                                        default = False
                                    }
                                    app = {
                                        type = "object"
                                        properties = {
                                            language = {
                                                type = "string"
                                                description = "The language. Currently supported languages: go, js."
                                                default = "go"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    status = {}
                }
            }
        }
    }]
}

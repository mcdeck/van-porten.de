require "jekyll-import";
JekyllImport::Importers::WordpressDotCom.run({
    "source" => "_import/olivervanporten.wordpress.2018-10-01.xml",
    "no_fetch_images" => false,
    "assets_folder" => "assets"
})
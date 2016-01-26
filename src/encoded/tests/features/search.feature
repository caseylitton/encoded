@search @usefixtures(workbook)
Feature: Search
    Background:
        When I visit "/search"
        And I wait for the content to load


    Scenario: Search
        Then the title should contain the text "Search"


    Scenario: Search Antibodies
        When I click the link with text that contains "Data"
        And I click the link to "/search/?type=AntibodyLot"
        And I wait for the content to load
        Then I should see at least 15 elements with the css selector "ul.nav.result-table > li"
        And I should see at least 5 elements with the css selector "div.box.facets > div.facet"

        When I click the link to "?type=AntibodyLot&targets.organism.scientific_name=Homo+sapiens"
        And I wait for the content to load
        Then I should see at least 10 elements with the css selector "ul.nav.result-table > li"

        When I click the link to "?type=AntibodyLot&targets.organism.scientific_name=Homo+sapiens&clonality=polyclonal"
        And I wait for the content to load
        Then I should see at least 7 elements with the css selector "ul.nav.result-table > li"

        When I click the link to "?type=AntibodyLot&targets.organism.scientific_name=Homo+sapiens&clonality=polyclonal&clonality=monoclonal"
        And I wait for the content to load
        Then I should see at least 10 elements with the css selector "ul.nav.result-table > li"


    Scenario: Search Biosamples
        When I click the link with text that contains "Data"
        And I click the link to "/search/?type=Biosample"
        And I wait for the content to load
        Then I should see at least 22 elements with the css selector "ul.nav.result-table > li"
        And I should see at least 7 elements with the css selector "div.box.facets > div.facet"

        When I click the link to "?type=Biosample&sex=unknown"
        And I wait for the content to load
        Then I should see at least 1 elements with the css selector "ul.nav.result-table > li"

        When I click the link to "?type=Biosample&sex=unknown&organism.scientific_name=Homo+sapiens"
        And I wait for the content to load
        Then I should see at least 13 elements with the css selector "ul.nav.result-table > li"


    Scenario: Search Experiments
        When I click the link with text that contains "Data"
        And I click the link to "/search/?type=Experiment"
        And I wait for the content to load
        Then I should see at least 13 elements with the css selector "ul.nav.result-table > li"
        And I should see at least 3 elements with the css selector "div.box.facets > div.facet"

        When I click the link to "?type=Experiment&assay_term_name=ChIP-seq"
        And I wait for the content to load
        Then I should see at least 3 elements with the css selector "ul.nav.result-table > li"

        When I click the link to "?type=Experiment&assay_term_name=ChIP-seq&assay_term_name=MethylArray"
        And I wait for the content to load
        Then I should see at least 5 elements with the css selector "ul.nav.result-table > li"

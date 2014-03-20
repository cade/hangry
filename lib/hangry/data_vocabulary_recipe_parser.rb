module Hangry
  class DataVocabularyRecipeParser < SchemaOrgRecipeParser

    def self.root_selector
      '[itemtype="http://data-vocabulary.org/Recipe"]'
    end

    def self.nutrition_selector
      '[itemtype="http://data-vocabulary.org/NutritionInformation"]'
    end

    def self.ingredient_itemprop
      :ingredient
    end

    private

    def parse_description
      node_with_itemprop(:summary).content
    end

    def parse_image_url
      node_with_itemprop(:photo)['src']
    end

    def parse_instructions
      node_with_itemprop(:instructions).content
    end

    def parse_published_date
      content = node_with_itemprop(:published).content
      content.blank? ? nil : Date.parse(content)
    rescue ArgumentError
    end

    def parse_yield
      node_with_itemprop(:yield).content
    end

  end

end


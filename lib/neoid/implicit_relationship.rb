module Neoid
  class ImplicitRelationship
    extend ActiveModel::Callbacks
    define_model_callbacks :save, :destroy

    include Neoid::Relationship
        
    attr_reader :start_node, :end_node
    
    def initialize(start_node, end_node, options)
      @start_node = start_node
      @end_node = end_node
      @options = options
    end
    
    def neo_relationship_options
      @options
    end
    
    def neo_save
      _neo_save
    end
    
    def id
      nil
    end
    
    def neo_unique_id
      "#{start_node.neo_unique_id}-#{end_node.neo_unique_id}"
    end
    
    def self.reflect_on_all_associations(macro=nil)
      []
    end
    
    def self.base_class
      self
    end
  end
end
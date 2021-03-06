require 'date'

class Item
  attr_accessor :publish_date, :archived, :author, :source, :label, :genre
  attr_reader :id

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(publish_date, archived = false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter
  # setter methods
  # rubocop:disable Lint/DuplicateMethods

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source(source)
    @source = source
  end

  def label=(label)
    @label = label
    label.item.push(self) unless label.item.include?(self)
  end

  def can_be_archived?
    current = Date.today
    current.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
  # rubocop:enable Lint/DuplicateMethods
end

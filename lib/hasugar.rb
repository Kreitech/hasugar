require_relative 'hasugar/version'

module Hasugar

  def transform(transformations)
    _dup = dup

    transformations.each do |k, v|
      if v.class == Hash
        _dup[k] = _dup[k].transform(v)
      else
        _dup[v] = _dup.delete(k) if _dup[k]
      end
    end

    _dup
  end

  def keep_keys!(*keys)
    keys_to_delete = self.keys - keys.flatten

    delete_keys!(keys_to_delete)
  end

  def keep_keys(*keys)
    keys_to_delete = self.keys - keys.flatten

    delete_keys(keys_to_delete)
  end

  def delete_keys!(*keys)
    keys.flatten.each do |k|
      delete(k)
    end

    self
  end

  def delete_keys(*keys)
    _dup = dup

    keys.flatten.each do |k|
      _dup.delete(k)
    end

    _dup
  end

  def require_keys(*keys)
    all_keys = keys.all? { |k|
      if k.class == Symbol
        self.key? k
      elsif k.class == Hash
        k.keys.all? { |i_k|
          self[i_k].require_keys(k[i_k])
        }
      elsif k.class == Array
        require_keys(*k)
      else
        false
      end
    }

    all_keys
  end

end

class Hash

  include Hasugar

end
